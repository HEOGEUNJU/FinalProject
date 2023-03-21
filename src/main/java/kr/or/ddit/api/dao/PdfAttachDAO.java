package kr.or.ddit.api.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.api.vo.PdfAttachVO;
import kr.or.ddit.board.vo.BoardVO;

@Mapper
public interface PdfAttachDAO {
	public int insertAttatches(PdfAttachVO pdfAttachVO);
	public PdfAttachVO selectAttatchList(String tblId);
	public PdfAttachVO selectAttatch(int attno);
	public int deleteAttatches(BoardVO board);
}
