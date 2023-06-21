package stock_m.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {
    private String VIEW_PATH = "/errors/";

    @RequestMapping(value = "/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if(status != null){
			/* int statusCode = Integer.valueOf(status.toString()); */
            return "error/error404";
			/*
			 * if(statusCode == HttpStatus.NOT_FOUND.value()){ return "error/error404"; }
			 * if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()){ return
			 * "error/error404"; }
			 */
        }
        return "error";
    }

	/*
	 * @Override public String getErrorPath() { return null; }
	 */
}