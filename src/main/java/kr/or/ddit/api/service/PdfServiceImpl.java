package kr.or.ddit.api.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.core.ApplicationContext;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.ddit.announcement.dao.AnnoDAO;
import kr.or.ddit.api.dao.PdfAttachDAO;
import kr.or.ddit.api.vo.PdfAttachVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.nio.charset.Charset;
import java.nio.file.Files;

@Slf4j
@Service
@RequiredArgsConstructor
public class PdfServiceImpl implements PdfService {
	private final AnnoDAO annoDao;
	private final PdfAttachDAO attachDAO;
	private final WebApplicationContext context;
	
	@Value("#{appInfo.resumeFolder}")
	private File saveFiles;
	
	private int saveResourceFile(PdfAttachVO pdfAttachVO) {
		int rowcnt = attachDAO.insertAttatches(pdfAttachVO);
		try {
			log.info("=======EL로 주입된 첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
//			pdfAttachVO.saveTo(saveFiles);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rowcnt;
	}

	@Override
	public int createHtmlPdf(
		String filename
		, String htmlStr
		, HttpServletRequest request
	) {
		ClassPathResource result = null;
		int cnt = 0;
		try {
			String serverPath = request.getSession().getServletContext().getRealPath("/") + "resources/css/";

			// 파일 저장 경로가 있는지 확인하고 없으면 생성하는 if문
			if (!saveFiles.exists() || saveFiles.isFile()) {
				saveFiles.mkdirs();
			}
			
			// 용지 설정, new Document(PageSize.A4.rotate())는 가로로 눕힌 모양
			Document document = new Document();
			String tblId = filename;
			filename += ".pdf";
			
			File pdfFile = new File(saveFiles, filename);
			
			//파일이 있으면 삭제(같은 이름으로 만들 때마다 새로 쓰기 위해서)
			if (pdfFile.isFile()) {
				pdfFile.delete();
			}
			
			//pdf를 만들기 시작한다.
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));

			document.open();

			htmlStr = "<html><body style='font-family: MalgunGothic;'>" + htmlStr + "</body></html>";

			//css파일 설정
			CSSResolver cssResolver = new StyleAttrCSSResolver();
			CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream(serverPath + "pdf.css"));
			cssResolver.addCss(cssFile);

			XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);

			//폰트를 설정한다. 폰트 설정 누락시 한글이 안보이는 경우 발생, MalgunGothic은 font-family용 alias
			fontProvider.register(serverPath + "malgun.ttf", "MalgunGothic");
//			fontProvider.register("c:/windows/fonts/malgun.ttf", "MalgunGothic"); 
			CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

			HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
			htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
			
			//html을 pdf로 변환시작
			PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
			CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

			XMLWorker worker = new XMLWorker(css, true);
			//Character Set
			XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));

			StringReader strReader = new StringReader(htmlStr);
			xmlParser.parse(strReader);

			document.close();
			writer.close();

			// Resource 구현체 정하기 ex) classpath...
			
			PdfAttachVO vo = new PdfAttachVO(pdfFile);
			vo.setTblId(tblId);
			
			log.info("=======뭐야 : {}",vo);
			
			cnt = saveResourceFile(vo);
			
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}

/*	
	@Override
	public String createPdf(String annoNo) {
		//이 메서드는 DB에 있는 값을 불러와서 테이블 형식으로 만들어주는 메서드이다.
		
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
	
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/sample.pdf"));
			// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

			document.open(); // 웹페이지에 접근하는 객체를 연다

			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,	BaseFont.EMBEDDED);
			// 한글폰트 처리

			Font font = new Font(baseFont, 12); // 폰트의 사이즈를 12픽셀로 한다.

			PdfPTable table = new PdfPTable(6); // 5개의 셀을 가진 테이블 객체를 생성 (pdf파일에 나타날 테이블)
			Chunk chunk = new Chunk("공고 목록", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
			//Paragraph (단락, 문단, 절)
			document.add(new Paragraph("This is the first Itext example 한글입력도될까요?",font));
			document.add(new Paragraph("공고뽑고싶다",font));
			//Chunk (부분, 규모가 큰)
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)

			PdfPCell cell1 = new PdfPCell(new Phrase("공고 번호", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)

			PdfPCell cell2 = new PdfPCell(new Phrase("공고 제목", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell3 = new PdfPCell(new Phrase("기업 이름", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

			table.addCell(cell1); // 그리고 테이블에 위에서 생성시킨 셀을 넣는다.
			table.addCell(cell2);
			table.addCell(cell3);

			// 공고 가져오기
			AnnoVO anno = annoDao.selectAnno(annoNo);
			PdfPCell cellProductName = new PdfPCell(new Phrase("" + anno.getAnnoNo(), font)); 
																								
			PdfPCell cellPrice = new PdfPCell(new Phrase(anno.getAnnoTitle(), font));
			// Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.

			PdfPCell cellAmount = new PdfPCell(new Phrase(anno.getCompany().getCmpName(), font));
			// Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.

			table.addCell(cellProductName); // 셀의 데이터를 테이블에 저장한다. (장바구니안에 들어있는 갯수만큼 테이블이 만들어진다)
			table.addCell(cellPrice);
			table.addCell(cellAmount);
			
			document.add(table); // 웹접근 객체에 table를 저장한다.
			document.close(); // 저장이 끝났으면 document객체를 닫는다.
			result = "pdf 파일이 생성되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			result = "pdf 파일 생성 실패...";
		}
		return result;
	}
*/	
}