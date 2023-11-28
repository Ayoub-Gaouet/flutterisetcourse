package org.isetn;

import org.isetn.entities.Departement;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "p1", types = {Departement.class})

public interface DepartementProjection {
    public Long getCodeDepartement();
    public String getNomDepartement();
    public int getNbreClass();
}
