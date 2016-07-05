package com.yiyun.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class GenIbatisCode {
	private String filePathDo = "src/ezlf/common/domain/";
	private String filePathXml = "src/main/resource/ibatis_mysql/ezlf/";
	private String datasourceFile = "src/main/resource/spring/dataSource.properties";
	private String[] mapTablename = { "SYS_GOODS_LTTYPE" };
	private Connection conn = null;
	private String url = "db.url";
	private String driver = "db.driver";
	private String username = "username";
	private String password = "password";
	private static String domainStr = "ezlf.common.domain";
	private String BLANK = "    ";

	public GenIbatisCode() {
		conn = getConnection();
	}

	/**
	 * private List getTableNames() {
	 * 
	 * List result = new Vector(); try { DatabaseMetaData dbmd =
	 * conn.getMetaData(); ResultSet rs = dbmd.getTableTypes(); String[] types =
	 * { "TABLE" }; rs = dbmd.getTables(null, dbmd.getUserName(), "%", types);
	 * while (rs.next()) { result.add(rs.getString("TABLE_NAME")); } rs.close();
	 * } catch (SQLException e) { e.printStackTrace(); } return result; }
	 */
	private String getMapStr(Map map, String key) {
		if (map.containsKey(key)) {
			return String.valueOf(map.get(key));
		}
		return "";
	}

	private Connection getConnection() {
		Map map = this.readProperties(datasourceFile);
		Connection conn = null;
		try {
			// ע����ݿ������
			Class.forName(getMapStr(map, this.driver));
		} catch (Exception e) {
			// ����д��Ϊ�˷�����Գ���
			System.err.println("getConnection(): " + e.getMessage());
		}
		try {
			conn = DriverManager.getConnection(getMapStr(map, this.url),
					getMapStr(map, this.username),
					getMapStr(map, this.password));
		} catch (Exception ex) {
			System.err.println("conn:" + ex.getMessage());
		}

		return conn;
	}

	public void getMetaData() {
		try {

			Statement stmt = conn.createStatement();
			// List list = getTableNames();
			for (int i = 0; i < mapTablename.length; i++) {
				String tableStr = (String) mapTablename[i];
				ResultSet rs = stmt.executeQuery("select * from " + tableStr);
				ResultSetMetaData rsmd = rs.getMetaData();
//				getXml(rsmd, tableStr);
				getDomain(rsmd, tableStr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getTableStr(String table) {
		String str = table.toLowerCase();
		String[] tmp = str.split("_");
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < tmp.length; i++) {
			sb.append(tmp[i].substring(0, 1).toUpperCase());
			if (tmp[i].length() > 1)
				sb.append(tmp[i].substring(1));
		}

		return sb.toString();
	}

	private String getColumnStr(String column) {
		String str = column.toLowerCase();
		String[] tmp = str.split("_");
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < tmp.length; i++) {
			if (i == 0) {
				sb.append(tmp[i]);
			} else {
				sb.append(tmp[i].substring(0, 1).toUpperCase());
				if (tmp[i].length() > 1)
					sb.append(tmp[i].substring(1));
			}
		}

		return sb.toString();
	}

	private String getColumnBigStr(String column) {
		if (column.length() > 1) {
			column = column.substring(0, 1).toUpperCase() + column.substring(1);
			return column;
		}
		return column;
	}

	private void getDomain(ResultSetMetaData rsmd, String tableName) {
		try {
			File file = new File(filePathDo);
			if (!file.exists()) {
				file.mkdir();
			}

			String tableNameDO = this.getTableStr(tableName) + "DO";
			file = new File(filePathDo + tableNameDO + ".java");

			String javacode = "package " + domainStr + "; \n";
			javacode += "import java.util.*;  \n";
			javacode += "import java.io.Serializable;  \n";
			javacode += "public class " + tableNameDO
					+ " implements Serializable {  \n";
			javacode += createColumnsStringForJava(rsmd);
			javacode += "}\n";
			System.out.println("javacode=" + javacode);
			FileWriter writer = new FileWriter(file);
			writer.write(javacode);
			writer.flush();
			writer.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getXml(ResultSetMetaData rsmd, String tableName) {
		try {
			File file = new File(filePathXml);
			if (!file.exists()) {
				file.mkdir();
			}
			String tableNameDo = getTableStr(tableName) + "DO";
			String tableNameStr = getTableStr(tableName);
			file = new File(filePathXml + "mapping-ezlf-" + tableNameStr
					+ ".xml");

			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?> \n";

			xml += "<!DOCTYPE sqlMap PUBLIC \"-//ibatis.apache.org//DTD SQL Map 2.0//EN\" \n";

			xml += "\"http://ibatis.apache.org/dtd/sql-map-2.dtd\"> \n";

			xml += "<sqlMap namespace=\"mapping-ezlf-" + tableNameStr
					+ "\"> \n";
			// xml += "<typeAlias alias=\"" + tableNameStr.toLowerCase() +
			// "\" type=\""+domainStr+"." + tableNameDo + "\"/> \n\n";

			xml += createResultMap(rsmd, tableName);
			xml += createSelectSql(rsmd, tableName);
			xml += createInsertSql(rsmd, tableName);
			// xml += createUpdateSql(rsmd, tableName);

			xml += "\n</sqlMap>";
			System.out.println("xml=" + xml);
			FileWriter writer = new FileWriter(file);
			writer.write(xml);
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * <select id="queryCommonInstTree"
	 * resultClass="resoft.ezlf.common.vo.ZTreeDTO"
	 * parameterClass="java.util.Map"> SELECT INST_SET_ID as id , INST_SET_NAME
	 * as name,0 as pId ,'true' as open ,'false' as isParent FROM
	 * ezlf.SYS_DIM_INST_SET where inst_set_type='0' </select>
	 */
	
	//����query ��ѯ���
	private String createSelectSql(ResultSetMetaData rsmd, String tableName)
			throws SQLException {
		String tableNameDO = this.getTableStr(tableName) + "DO";
		String tableNameStr = this.getTableStr(tableName);
		String tableNameMapStr = tableNameDO + "Map";
		String result = "<select id=\"select" + tableNameStr
				+ "\" parameterClass=\"java.util.Map" + "\" resultMap=\""
				+ tableNameMapStr + "\"> \n";

		result += "select \n" + createColumnsString(rsmd) + "\n from \n "
				+ tableName + " \n";

		result += "</select> \n";

		return result;
	}
	
	//����where �������
	private String createWhereSql(ResultSetMetaData rsmd, String tableName)
			throws SQLException {
		String tableNameDO = this.getTableStr(tableName) + "DO";
		String tableNameStr = this.getTableStr(tableName);
		String tableNameMapStr = tableNameDO + "Map";
		String result = "<select id=\"select" + tableNameStr
				+ "\" parameterClass=\"java.util.Map" + "\" resultMap=\""
				+ tableNameMapStr + "\"> \n";

		result += "select \n" + createColumnsString(rsmd) + "\n from \n "
				+ tableName + " \n";

		result += "</select> \n";

		return result;
	}
	
	
	//���� insert �������
	private String createInsertSql(ResultSetMetaData rsmd, String tableName)
			throws SQLException {
		String tableNameDO = this.getTableStr(tableName) + "DO";
		String tableNameStr = this.getTableStr(tableName);
		String result = "<insert id=\"insert" + tableNameStr
				+ "\" parameterClass=\"" + domainStr + "." + tableNameDO
				+ "\"> \n";

		result += "INSERT INTO \n" + tableName + " (\n"
				+ createColumnsString(rsmd) + "\n)\n values(\n"
				+ createWheremapSql(rsmd) + "\n) \n";

		result += "</insert> \n";

		return result;
	}

	private String createUpdateSql(ResultSetMetaData rsmd, String tableName)
			throws SQLException {
		/*
		 * <update id="MS-AUTH-USER-INFO-INFORM-FLAG"> <![CDATA[ update
		 * auth_user_info set INFORM_FLAG=#informFlag# where (id = #id:BIGINT#)
		 * ]]> </update>
		 */
		String tableNameStr = this.getTableStr(tableName);
		String result = "<update id=\"update" + tableNameStr + "\" > \n";

		result += "<![CDATA[\n";
		result += "update  \n" + tableName + " (\n" + createColumnsString(rsmd)
				+ "\n)\n values(\n" + createWheremapSql(rsmd) + "\n) \n";

		result += " ]]>\n</update> \n";

		return result;
	}

	//����resultMap
	private String createResultMap(ResultSetMetaData rsmd, String tableName)
			throws SQLException {
		String tableNameDO = getTableStr(tableName) + "DO";
		String tableNameMapStr = tableNameDO + "Map";
		String result = "<resultMap id=\"" + tableNameMapStr + "\"  class=\""
				+ domainStr + "." + tableNameDO + "\"> \n";

		int numberOfColumns = rsmd.getColumnCount();
		for (int i = 1; i <= numberOfColumns; i++) {
			String colName = rsmd.getColumnName(i);
			result += "<result property=\"" + getColumnStr(colName)
					+ "\" column=\"" + colName + "\"/> \n";
		}
		result += " </resultMap> \n";

		return result;
	}

	private String createColumnsString(ResultSetMetaData rsmd)
			throws SQLException {

		String result = " ";
		int numberOfColumns = rsmd.getColumnCount();
		for (int i = 1; i <= numberOfColumns; i++) {
			String colName = rsmd.getColumnName(i);
			result += colName + ",\n";
		}
		return result.substring(1, result.length() - 2);

	}

	private String createColumnsStringForJava(ResultSetMetaData rsmd)
			throws SQLException {

		String result = "";
		StringBuffer sb = new StringBuffer();
		int numberOfColumns = rsmd.getColumnCount();
		for (int i = 1; i <= numberOfColumns; i++) {
			String colName = rsmd.getColumnName(i);
			String coltype = rsmd.getColumnTypeName(i);
			String ctype = getType(coltype);
			String cname = getColumnStr(colName);
			result += BLANK + "private " + ctype + " " + cname + "; \n";
			System.out.println("colName=" + colName + " coltype=" + coltype
					+ " result=" + result);
			sb.append(genGetSetStr(ctype, cname));
		}
		result += "\n" + sb.toString();
		return result;
	}

	/*
	 * public String getChecked(){ return checked; }
	 * 
	 * public void setChecked(String checked){ this.checked = checked; }
	 */

	private String genGetSetStr(String coltype, String column) {
		String temp = getColumnBigStr(column);
		String str = "\n public ";
		str += coltype + "  get" + temp + "(){\n";
		str += " return " + column + " ;\n }\n";
		str += " public void set" + temp + "(" + coltype + " " + column
				+ "){\n";
		str += " this." + column + " =" + column + " ;\n}\n";
		return str;
	}

	private String createWheremapSql(ResultSetMetaData rsmd)
			throws SQLException {

		String result = " ";
		int numberOfColumns = rsmd.getColumnCount();
		for (int i = 1; i <= numberOfColumns; i++) {
			String colName = rsmd.getColumnName(i);
			// String name = rsmd.getColumnTypeName(i);
			result += "#" + this.getColumnStr(colName) + "#,\n";
		}
		return result.substring(1, result.length() - 2);

	}

	private String getType(String type) {
		String Type = "";
		if (type.equals("NUMBER")||type.equals("INT UNSIGNED"))
			Type = "Integer";
		if (type.equals("CLOB"))
			Type = "String";
		if (type.equals("VARCHAR2"))
			Type = "String";
		if (type.equals("VARCHAR"))
			Type = "String";
		if (type.equals("CHAR"))
			Type = "String";
		if (type.equals("TIMESTAMP"))
			Type = "Date";
		if (type.equals("DATE"))
			Type = "Date";
		if (type.equals("INTEGER"))
			Type = "Integer";
		if (type.equals("DECIMAL"))
			Type = "Double";

		return Type;
	}

	public static Map readProperties(String filePath) {
		// src/main/resource/spring/dataSource.properties
		Map map = new HashMap();
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			Enumeration en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				String Property = props.getProperty(key);
				System.out.println(key + "=" + Property);
				map.put(key, Property);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public static void main(String[] args) throws SQLException {
		new GenIbatisCode().getMetaData();
	}

}
