package xyz.hees.controller;

import xyz.hees.controller.action.Action;
import xyz.hees.controller.action.BoardDeleteAction;
import xyz.hees.controller.action.BoardListAction;
import xyz.hees.controller.action.BoardUpdateAction;
import xyz.hees.controller.action.BoardUpdateFormAction;
import xyz.hees.controller.action.BoardViewAction;
import xyz.hees.controller.action.BoardWriteAction;
import xyz.hees.controller.action.BoardWriteFormAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	public ActionFactory() {}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("board_list")) {
			action = new BoardListAction();
		} else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		/*
		} else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		}
		*/
		} else if(command.equals("board_view")) {
			action = new BoardViewAction();
		} else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		/*
		} else if(command.equals("board_update")) {
			action = new BoardUpdateAction();
		*/
		} else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();
		}
		System.out.println("action : "+action);
		return action;
	}
}
