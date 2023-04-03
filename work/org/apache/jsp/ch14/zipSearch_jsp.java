/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.72
 * Generated at: 2023-03-23 06:06:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ch14;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ch14.ZipcodeBean;
import java.util.Vector;

public final class zipSearch_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("ch14.ZipcodeBean");
    _jspx_imports_classes.add("java.util.Vector");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      ch14.MemberMgr mgr = null;
      mgr = (ch14.MemberMgr) _jspx_page_context.getAttribute("mgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mgr == null){
        mgr = new ch14.MemberMgr();
        _jspx_page_context.setAttribute("mgr", mgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');

   String search = request.getParameter("search");
   Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
   //serach값이 y는 검색, n는 창만 open
   String area3 = null;
   if(search.equals("y")){
      area3 = request.getParameter("area3");
      vlist = mgr.searchZipcode(area3);
   }
 //  out.print(vlist.size());

      out.write("\r\n");
      out.write("<title>우편번호 검색</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   function loadSearch() {\r\n");
      out.write("      frm = document.zipFrm;\r\n");
      out.write("      if(frm.area3.value==\"\"){\r\n");
      out.write("         alert(\"도로명을 입력하세요.\");\r\n");
      out.write("         return;\r\n");
      out.write("      }\r\n");
      out.write("      frm.action = \"zipSearch.jsp\";\r\n");
      out.write("      frm.submit();\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   function sendAdd(zipcode, adds) {\r\n");
      out.write("    //  alert(zipcode + \" \" + adds);\r\n");
      out.write("    opener.document.regFrm.zipcode.value = zipcode;\r\n");
      out.write("    opener.document.regFrm.address.value = adds;\r\n");
      out.write("    self.close();\r\n");
      out.write("   }\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#FFFFCC\">\r\n");
      out.write("   <div align=\"center\">\r\n");
      out.write("      <br />\r\n");
      out.write("      <form name=\"zipFrm\" method=\"post\">\r\n");
      out.write("         <table>\r\n");
      out.write("            <tr>\r\n");
      out.write("               <td>\r\n");
      out.write("               <br/>도로명 입력 :    <input name=\"area3\">\r\n");
      out.write("                  <input type=\"button\" value=\"검색\" onclick=\"loadSearch()\">\r\n");
      out.write("               </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <!-- 검색 결과 Start -->\r\n");
      out.write("			");

				if(search.equals("y")){
					if(vlist.isEmpty()){
			
      out.write("\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td align=\"center\"><br>검색된 결과가 없습니다.</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			");

					}else{
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<td align=\"center\"><br>※검색 후, 아래 주소를 클릭하면 자동으로 입력됩니다.</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("	");

				for(int i = 0; i< vlist.size(); i++){
					ZipcodeBean bean = vlist.get(i);
					String zipcode = bean.getZipcode();
					String adds = bean.getArea1() + " ";
					adds+= bean.getArea2() + " ";
					adds+= bean.getArea3() + " ";
		
      out.write("\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td><a href=\"#\" onclick=\"sendAdd('");
      out.print(zipcode);
      out.write("'\r\n");
      out.write("			, '");
      out.print(adds);
      out.write("')\"> ");
      out.print(zipcode + " " + adds);
      out.write("</a></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		
				}	//for
			}	// if2
		}	// if1
	
      out.write("\r\n");
      out.write("            <!-- 검색 결과 End -->\r\n");
      out.write("            <tr>\r\n");
      out.write("               <td align=\"center\"><br/>\r\n");
      out.write("               <a href=\"#\" onClick=\"self.close()\">닫기</a></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("         </table>\r\n");
      out.write("         <input type=\"hidden\" name=\"search\" value=\"y\">\r\n");
      out.write("      </form>\r\n");
      out.write("   </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
