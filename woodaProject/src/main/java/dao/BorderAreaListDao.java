package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class BorderAreaListDao {
	private static BorderAreaListDao borderAreaListDao;
	private Connection conn;
	private BorderAreaListDao() {}

	public static BorderAreaListDao getInstance() {
		if (borderAreaListDao == null)	borderAreaListDao = new BorderAreaListDao();
		return borderAreaListDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	public int getBoderListCount(String where) {
		Statement stmt = null;
		ResultSet rs = null;
		int rcnt = 0;
		
		try {
			stmt = conn.createStatement();
			String sql = "select count(*) cnt from t_board_story " + where;
			rs = stmt.executeQuery(sql);
			
			if(rs.next())	rcnt = rs.getInt("cnt");
			
		}catch(Exception e) {
			System.out.println("BoderListDao 클래스의 getBoderListCount() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return rcnt;
	}
	
	public ArrayList<BorderInfo> getBoderList(String where, int cpage, int psize, String orderBy){
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<BorderInfo> AreaList = new ArrayList<BorderInfo>();
		BorderInfo bi = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select bs_num, bs_img1, bs_title, bs_start, bs_end, bs_place1, bs_place2, bs_place3 from t_board_story  "
			+ where + orderBy + 
			" limit " + ((cpage - 1) * psize) + ", " + psize;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				bi = new BorderInfo();
				bi.setBs_num(rs.getInt("bs_num"));
				bi.setBs_title(rs.getString("bs_title"));
				bi.setBs_img1(rs.getString("bs_img1"));
				bi.setBs_start(rs.getString("bs_start"));
				bi.setBs_end(rs.getString("bs_end"));
				bi.setBs_place1(rs.getString("bs_place1"));
				bi.setBs_place2(rs.getString("bs_place2"));
				bi.setBs_place3(rs.getString("bs_place3"));
				AreaList.add(bi);
			}
		}catch(Exception e) {
			System.out.println("BoderListDao 클래스의 getBoderList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return AreaList;
	}
	
	
	
	
}

