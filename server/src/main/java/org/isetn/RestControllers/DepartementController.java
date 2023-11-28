package org.isetn.RestControllers;



import org.isetn.entities.Departement;
import org.isetn.repository.DepartementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("departement")

public class DepartementController {
    @Autowired
    private DepartementRepository departementRepository;

    @PostMapping("/add")
    public Departement add(@RequestBody Departement departement ) {
        return departementRepository.save(departement);
    }

    @GetMapping("/all")
    public List<Departement> getAll() {
        return departementRepository.findAll();
    }




    @DeleteMapping("/delete")
    public void delete(@Param("id") Long id)
    {
        Departement d =  departementRepository.findById(id).get();
        departementRepository.delete(d);
    }

    @PutMapping("/update")
    public Departement update(@RequestBody Departement departement) {
        return departementRepository.save(departement);
    }
}