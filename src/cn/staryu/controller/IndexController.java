package cn.staryu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * 2017/11/6 18:46
 */
@Controller
public class IndexController {

    @RequestMapping("/showlogin")
    public String chooseIdentity(@RequestParam("href") String href) {

            return href;

    }
}