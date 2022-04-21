package com.mycompany.app;

import io.usethesource.vallang.IInteger;
import io.usethesource.vallang.IValueFactory;


public class App 
{
    private final IValueFactory vf;

    public App(IValueFactory vf) {
        this.vf = vf;
    }
    public IInteger BigIncrement(IInteger rascal_value) {
        // Convert to Java value
        int java_value = rascal_value.intValue();

        // Big increment
        java_value += 100;

        // Return value that can be used in Rascal
        return vf.integer(java_value);
    }
}