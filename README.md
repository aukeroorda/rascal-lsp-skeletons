# rascal-lsp-skeletons


## Initializing a Maven project
Based on [https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

To create a new directory named `my-app` with a new Maven project:
```sh
mvn archetype:generate \
    -DgroupId=com.mycompany.app \
    -DartifactId=my-app \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=1.4 \
    -DinteractiveMode=false
```

From here on, start working inside the `my-app` directory:
```
cd my-app
```

## Including Rascal project information
First, create a directory to hold the Rascal project information:
```
mkdir META-INF && cd META-INF 
```

In this directory, create a file `RASCAL.MF` with the following contents:
```
Manifest-Version: 0.0.1
Main-Function: main
Project-Name: my-app
Main-Module: VSMain
Source: src
```

## Creating a Rascal file
Next up, create a Rascal file `Syntax.rsc` in the constructed `my-app/src/` directory.
```rascal
module Syntax

extend lang::std::Layout;
extend lang::std::Id;

start syntax Machine = machine: State+ states;
syntax State = @Foldable state: "state" Id name Trans* out;
syntax Trans = trans: Id event ":" Id to;
```

## Working with Java bindings
In Rascal, you can bind functions to Java. To convert values between Rascal and Java, we use the library [Vallang](). This has to be added as a dependency to the maven project first in the file `pom.xml`. Vallang is available from the [usethesource maven repository](https://releases.usethesource.io/maven/):
```xml
  <repositories>
    <repository>
      <id>usethesource</id>
      <url>https://releases.usethesource.io/maven/</url>
    </repository>
  </repositories>
  <pluginRepositories>
    <pluginRepository>
      <id>usethesource</id>
      <url>https://releases.usethesource.io/maven/</url>
    </pluginRepository>
  </pluginRepositories>
```
Now that Vallang can be found, add it as a dependency for the project in the `dependencies` element:
```xml
    <dependency>
      <groupId>io.usethesource</groupId>
      <artifactId>vallang</artifactId>
      <version>0.14.4</version>
    </dependency>
```
Next up, let Maven download and install the dependencies:
```
mvn verify
```
Now the Vallang library is available in our Java files. First add a constructor taking an `IValueFactory` object:
```java
import io.usethesource.vallang.IInteger;
import io.usethesource.vallang.IValueFactory;


public class App 
{
    private final IValueFactory vf;

    public App(IValueFactory vf) {
        this.vf = vf;
    }
}
```

and then add a function `BigIncrement` to the `src/main/java/com/mycompany/app/App.java` file:
```java
    public IInteger BigIncrement(IInteger rascal_value) {
        // Convert to Java value
        int java_value = rascal_value.intValue();

        // Big increment
        java_value += 100;

        // Return value that can be used in Rascal
        return vf.integer(java_value);
    }
```


And finally, lets create the binding between Rascal and the Java file we created:Lets do this in a new file `CallJavaFunction.rsc`:
```
module CallJavaFunction


@javaClass{rascalJava.FuzzyWuzzyBinding}
public java int fuzz_token_sort_ratio(str lhs, str rhs);
```
