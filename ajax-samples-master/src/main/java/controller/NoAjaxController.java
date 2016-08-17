package controller;

import javax.validation.Valid;

import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class NoAjaxController {
	
	@RequestMapping(value="/userNoAjax",method=RequestMethod.GET)
	public String showFormNoAjax(Model model){
		model.addAttribute("user", new User());
		return "01-no-ajax/userForm";
	}
	
	@RequestMapping(value="/userNoAjax",method=RequestMethod.POST)
	public String processFormNoAjax(Model model, @Valid User user, BindingResult result ){
		if(result.hasErrors()) {
			return "01-no-ajax/userForm";
		} 
		else {
			return "success";
		}
	}
	
}
