package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PrintWriter printWriter = response.getWriter();
			
			//printWriter.println(title);
			//printWriter.println(content);
			
			Note note = new Note(title,content,new Date());
			
			//System.out.println(note.getId()+" "+note.getTitle()+" "+note.getAddedDate()+" "+note.getContent());
			//printWriter.println(note.getId()+" "+note.getTitle()+" "+note.getAddedDate()+" "+note.getContent());
			
			Session session = FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(note);
			transaction.commit();
			session.close();
			response.setContentType("text/html");
			printWriter.println("<h2 style='text-align:center;'> Note is added </h2>");
			printWriter.println("<h2 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h2>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
