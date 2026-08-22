package com.cubesofttech.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.testng.Assert;
import org.testng.annotations.Test;

public class FaqSectionRebuilderTest {

	private static Elements rebuild(String bodyHtml) {
		Document doc = Jsoup.parseBodyFragment(bodyHtml);
		FaqSectionRebuilder.rebuildFaqSections(doc);
		return doc.body().select(".faq-item");
	}

	@Test
	public void singleParagraphWithBrSeparatedPairs_splitsIntoThreeItems() {
		String html = "<h2>คำถามที่พบบ่อย (FAQ)</h2>"
				+ "<p>Q1: ราคาเท่าไหร่?<br>เริ่มต้นที่ 999 บาท<br>"
				+ "Q2: จัดส่งกี่วัน?<br>ภายใน 3 วันทำการ<br>"
				+ "Q3: คืนสินค้าได้ไหม?<br>คืนได้ภายใน 7 วัน</p>";

		Elements items = rebuild(html);

		Assert.assertEquals(items.size(), 3);
		Assert.assertEquals(items.get(0).select(".faq-question").text(), "ราคาเท่าไหร่?");
		Assert.assertEquals(items.get(1).select(".faq-question").text(), "จัดส่งกี่วัน?");
		Assert.assertEquals(items.get(2).select(".faq-question").text(), "คืนสินค้าได้ไหม?");
	}

	@Test
	public void headingPerQuestion_trustsStructureEvenWithoutQuestionWording() {
		String html = "<h2>คำถามที่พบบ่อย (FAQ)</h2>"
				+ "<h3>Q1: เหมาะกับใคร</h3><p>เหมาะกับทีมขนาดเล็กถึงกลาง</p>"
				+ "<h3>Q2: แพ็กเกจนี้ยืดหยุ่นหรือเหมาะกับองค์กร</h3><p>ยืดหยุ่นปรับตามขนาดองค์กรได้</p>"
				+ "<h3>Q3: มีทดลองใช้ฟรีไหม</h3><p>มี ทดลองใช้ฟรี 14 วัน</p>";

		Elements items = rebuild(html);

		Assert.assertEquals(items.size(), 3);
		// ข้อ 2 ไม่ได้ลงท้ายด้วย "?"/"ไหม" และไม่มีคำถามกลางประโยคในลิสต์ - ต้องรอดเพราะเป็น <h3>
		Assert.assertEquals(items.get(1).select(".faq-question").text(), "แพ็กเกจนี้ยืดหยุ่นหรือเหมาะกับองค์กร");
		Assert.assertEquals(items.get(1).select("p").text(), "ยืดหยุ่นปรับตามขนาดองค์กรได้");
	}

	@Test
	public void strongLabelWithBrBeforeAnswer_stripsLabelAndSplitsAnswer() {
		String html = "<h2>คำถามที่พบบ่อย (FAQ)</h2>"
				+ "<p><strong>Q1: ใช้เวลาติดตั้งนานไหม?</strong><br>ติดตั้งเสร็จภายใน 1 วัน</p>";

		Elements items = rebuild(html);

		Assert.assertEquals(items.size(), 1);
		Assert.assertEquals(items.get(0).select(".faq-question").text(), "ใช้เวลาติดตั้งนานไหม?");
		Assert.assertEquals(items.get(0).select("p").text(), "ติดตั้งเสร็จภายใน 1 วัน");
	}

	@Test
	public void headingWrappedInOwnContainer_faqItemsAreSiblingsOfWrapperNotHeading() {
		String html = "<div class=\"faq-list\">"
				+ "    <header>"
				+ "        <h2><b>FAQ</b></h2>"
				+ "    </header>"
				+ "    <div class=\"faq-item\">"
				+ "        <div class=\"faq-q\"><b>Q1: ใช้งานยากไหม?</b></div>"
				+ "        <div class=\"faq-a\">คำตอบ 1</div>"
				+ "    </div>"
				+ "    <div class=\"faq-item\">"
				+ "        <div class=\"faq-q\"><b>Q2: มีค่าใช้จ่ายเพิ่มไหม?</b></div>"
				+ "        <div class=\"faq-a\">คำตอบ 2</div>"
				+ "    </div>"
				+ "</div>";

		Elements items = rebuild(html);

		Assert.assertEquals(items.size(), 2);
		Assert.assertEquals(items.get(0).select(".faq-question").text(), "ใช้งานยากไหม?");
		Assert.assertEquals(items.get(0).select("p").text(), "คำตอบ 1");
		Assert.assertEquals(items.get(1).select(".faq-question").text(), "มีค่าใช้จ่ายเพิ่มไหม?");
		Assert.assertEquals(items.get(1).select("p").text(), "คำตอบ 2");
	}

	@Test
	public void questionWordMidSentenceInAnswer_doesNotSplitIntoNewItem() {
		String html = "<h2>FAQ</h2>"
				+ "<div class=\"faq-item\">"
				+ "  <div class=\"faq-question\">คนทั่วไปควรเริ่มเรียนรู้ AI Agent จากอะไร?</div>"
				+ "  <p>เริ่มจากการเข้าใจ Workflow การทำงานของตัวเองก่อน แล้วลองใช้ AI ในงานเล็ก ๆ เช่น"
				+ "  สรุปเอกสาร วางแผนงาน หรือเชื่อมต่อเครื่องมือต่าง ๆ เพื่อให้เห็นภาพว่า AI ช่วยอะไรได้จริง</p>"
				+ "</div>";

		Elements items = rebuild(html);

		Assert.assertEquals(items.size(), 1);
		Assert.assertEquals(items.get(0).select(".faq-question").text(), "คนทั่วไปควรเริ่มเรียนรู้ AI Agent จากอะไร?");
		Assert.assertTrue(items.get(0).select("p").text().endsWith("AI ช่วยอะไรได้จริง"));
	}
}
