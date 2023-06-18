package ru.rentalofpremises.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.rentalofpremises.models.Apartment;
import ru.rentalofpremises.models.Rent;
import ru.rentalofpremises.models.User;
import ru.rentalofpremises.services.ApartmentService;
import ru.rentalofpremises.services.UserService;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ApartmentController {
    private final ApartmentService apartmentService;
    private final UserService userService;
    //private final RentService rentService;

    // СПИСОК ВСЕХ АПАРТАМЕНТОВ

    @GetMapping("/")
    public String apartments(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("apartments", apartmentService.listApartments(title));
        model.addAttribute("user", apartmentService.getUserByPrincipal(principal));
        return "apartments";
    }

    // ИНФА ПРО АПАРТАМЕНТЫ

    @GetMapping("/apartment/{id}")
    public String apartmentInfo(@PathVariable Long id, Model model) {
        Apartment apartment = apartmentService.getApartmentById(id);
        model.addAttribute("apartment", apartment);
        return "apartment-info";
    }

    // СОЗДАТЬ АПАРТАМЕНТЫ

    @GetMapping("/apartment/create")
    public String createApartment() throws IOException {
        return "apartment-create";
    }

    @PostMapping("/apartment/create")
    public String createApartment(Apartment apartment, Principal principal) throws IOException {
        apartmentService.saveApartment(principal, apartment);
        return "redirect:/";
    }

    // УДАЛИТЬ АПАРТАМЕНТЫ

    @PostMapping("/apartment/delete/{id}")
    public String deleteApartment(@PathVariable Long id) {
        apartmentService.deleteApartment(id);
        return "redirect:/";
    }



}

