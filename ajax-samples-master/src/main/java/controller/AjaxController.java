package controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import model.ErrorMessage;
import model.ValidationResponse;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AjaxController {
	
	@RequestMapping(value="/userAjax",method=RequestMethod.GET)
	public String showFormAjax(Model model){
		model.addAttribute("user", new User());
		return "02-ajax/userForm";
	}
	
	@RequestMapping(value="/userAjax.json",method=RequestMethod.POST)
	public @ResponseBody ValidationResponse processFormAjaxJson(Model model, @ModelAttribute(value="user") @Valid User user, BindingResult result ){
		ValidationResponse res = new ValidationResponse();
		if(result.hasErrors()){
			res.setStatus("FAIL");
			List<FieldError> allErrors = result.getFieldErrors();
			List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getField() + "  " + objectError.getDefaultMessage()));
			}
			res.setErrorMessageList(errorMesages);

		}else{
			res.setStatus("SUCCESS");
		}
		
		return res;
	}

	@RequestMapping(value="/userAjax.htm",method=RequestMethod.POST)
	public String processFormAjax(@ModelAttribute(value="user") @Valid User user, BindingResult result ){
		if(result.hasErrors()) {
			return "02-no-ajax/userForm";
		} 
		else {
			return "success";
		}
	}
}
