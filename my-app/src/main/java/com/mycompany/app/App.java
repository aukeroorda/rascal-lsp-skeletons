package com.mycompany.app;

import io.usethesource.vallang.IInteger;
import io.usethesource.vallang.IString;
import io.usethesource.vallang.IValueFactory;

import org.rascalmpl.exceptions.RuntimeExceptionFactory;

import frink.errors.FrinkEvaluationException;
import frink.parser.Frink;

public class App 
{
    private final IValueFactory vf;
    private Frink interp;

    public App(IValueFactory vf) {
        this.vf = vf;
        this.interp = new Frink();

        // Enable restrictive mode, since we cannot trust user input
        // Enabling restrictive mode however prevents Frink itself from accessing its internal units.txt file :(
        // However, we can first load these units by doing a dummy calculation
        try {
			this.interp.parseString("1/2 c");
		} catch (FrinkEvaluationException e) {
			System.err.print("Frink could not convert the dummy input: 1/2 c");
			e.printStackTrace();
		}

        // Now that the units are loaded, we can enable restrictive mode
        this.interp.setRestrictiveSecurity(true);

    }

    public IInteger BigIncrement(IInteger rascal_value) {
        // Convert to Java value
        int java_value = rascal_value.intValue();

        // Big increment
        java_value += 100;

        // Return value that can be used in Rascal
        return vf.integer(java_value);
    }

    public IString frink_parse(IString text)
    {
        String unsafe_user_input = text.getValue();
        String result = "";

        try
        {
           result = interp.parseString(unsafe_user_input);
        }
        catch (FrinkEvaluationException e)
        {
            // Rethrow as Rascal exception
            throw RuntimeExceptionFactory.illegalArgument(text, "Input cannot be converted by Frink");
        }

        return vf.string(result);
    }

}