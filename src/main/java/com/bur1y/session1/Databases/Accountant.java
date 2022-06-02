package com.bur1y.session1.Databases;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "accountant")
public class Accountant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idassistants", nullable = false)
    private Integer id;

    @Column(name = "login", length = 100)
    private String login;

    @Column(name = "password", length = 100)
    private String password;

    @Column(name = "FIO", length = 100)
    private String fio;

    @Column(name = "release_date")
    private Instant releaseDate;

    @Column(name = "set_services", length = 100)
    private String setServices;

    @Column(name = "company_accounts", length = 100)
    private String companyAccounts;

    public String getCompanyAccounts() {
        return companyAccounts;
    }

    public void setCompanyAccounts(String companyAccounts) {
        this.companyAccounts = companyAccounts;
    }

    public String getSetServices() {
        return setServices;
    }

    public void setSetServices(String setServices) {
        this.setServices = setServices;
    }

    public Instant getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Instant releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}