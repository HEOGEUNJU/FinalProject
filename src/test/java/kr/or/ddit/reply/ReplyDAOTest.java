package kr.or.ddit.reply;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.board.dao.ReplyDAO;
import kr.or.ddit.process.ProcessDAOTest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

	private String replyNo = "RPY000020";

	@Test
	public void test() {
		int i = dao.deleteeReply(replyNo);
		log.info("값 확인 replyNo {} / 결과 {}", replyNo, i);
	}

}
