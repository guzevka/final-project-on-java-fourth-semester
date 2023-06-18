package ru.rentalofpremises.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.rentalofpremises.models.Rent;
import ru.rentalofpremises.models.User;
import ru.rentalofpremises.services.ApartmentService;
import ru.rentalofpremises.services.RentService;
import ru.rentalofpremises.services.UserService;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class RentController {
    @Autowired
    private RentService rentService;
    @Autowired
    private UserService userService;
    @Autowired
    private ApartmentService apartmentService;

    @GetMapping("/profile")
    // 1. только авторизованный пользователь может зайти на свой профиль
    // 2. доступ разрешен только известным пользователям, которые зашли в систему
    @Secured({"IS_AUTHENTICATED_FULLY", "IS_AUTHENTICATED_REMEMBERED"})
    public String profile(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByEmail(auth.getName());
        model.addAttribute("user", user);
        return "profile/index";
    }
    // модель - это интерфейс, который передает всю необходимую инфу в представления,
    // с помощью addAttribute

    @GetMapping("/profile/rents")
    @Secured({"IS_AUTHENTICATED_FULLY", "IS_AUTHENTICATED_REMEMBERED"})
    public String myRents(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByEmail(auth.getName());
        List<Rent> rents = rentService.findAllByUser(user);
        model.addAttribute("list", rents);
        return "profile/list";
    }

    @GetMapping("/rents/new/{id}")
    @PreAuthorize("hasAuthority('ROLE_USER') or hasAuthority('ROLE_ADMIN')")
    public String addRent(@PathVariable long id, Model model) {
        model.addAttribute("object", new Rent());
        model.addAttribute("apartment", apartmentService.getApartmentById(id));
        return "rents/new";
    }

    @PostMapping("/rents/add")
    @PreAuthorize("hasAuthority('ROLE_USER') or hasAuthority('ROLE_ADMIN')")
    public String addRent(@ModelAttribute("object") Rent object, BindingResult br, Model model) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User user = userService.findByEmail(auth.getName());
            object.setUser(user);
            rentService.save(object);
        } catch(Exception e) {
            e.printStackTrace();
            model.addAttribute("object", new Rent());
            model.addAttribute("apartment", apartmentService.getApartmentById(object.getApartment().getId()));
            model.addAttribute("error", "Нет доступных апартаментов на выбранный период");
            return "rents/new";
        }
        return "redirect:/";
    }

    @GetMapping("/rents/{id}/return_ap")
    public String returnApartment(@PathVariable("id") Long id, Model model) {
        Rent rent = rentService.findById(id);
        rent.setEnd_date(LocalDate.now());
        try {
            rentService.save(rent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/profile/rents";
    }

    @GetMapping("/rents/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Rent object = rentService.findById(id);
        model.addAttribute("object", object);
        return "rents/edit";
    }

    @PostMapping("/rents/edit")
    public String edit(@ModelAttribute("object") Rent rent, BindingResult br, Model model) {
        if (br.hasErrors()) {
            return "rents/edit";
        }
        try {
            rentService.save(rent);

        } catch (Exception e) {
            model.addAttribute("error", "Нет доступных апартаментов на выбранный период");
            return "rents/edit";
        }
        return "redirect:/profile/rents";
    }

}
