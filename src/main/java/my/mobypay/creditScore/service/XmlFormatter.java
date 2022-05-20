package my.mobypay.creditScore.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.xml.serialize.OutputFormat;
import org.apache.xml.serialize.XMLSerializer;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class XmlFormatter {
	public String format(String unformattedXml) {
		try {
			Document document = parseXmlFile(unformattedXml);

			OutputFormat format = new OutputFormat(document);
			format.setLineWidth(65);
			format.setIndenting(true);
			format.setIndent(2);
			Writer out = new StringWriter();
			XMLSerializer serializer = new XMLSerializer(out, format);
			serializer.serialize(document);

			return out.toString();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}

	}
	
	private Document parseXmlFile(String in) {
		try {

			
			
			
			
			  DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			  DocumentBuilder db = dbf.newDocumentBuilder(); InputSource is = new
			  InputSource(new StringReader(in)); return db.parse(is);
			 
			 

			
			
			
			/*
			 * DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			 * 
			 * DocumentBuilder db = dbFactory.newDocumentBuilder(); Document doc =
			 * db.parse(new InputSource(in)); return doc;
			 */
			 
			 

			// log.info("======new class for xml beautifier==========="+doc);

		} catch (ParserConfigurationException e) {
			throw new RuntimeException(e);
		} catch (SAXException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
