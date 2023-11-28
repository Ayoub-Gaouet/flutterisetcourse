package org.isetn.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Departement {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long codDepartement;
    private String nomDepartement;

    @OneToMany(mappedBy="departement" , cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Classe> classes;

}