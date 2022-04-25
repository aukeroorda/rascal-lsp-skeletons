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
You should now be able to import this module in a Rascal console in either of two ways:
- Click `Import in new Rascal terminal` at the top of the `Syntax.rsc` source file or
- Open a Rascal Terminal yourself (cmd/ctrl + shift + P > Create Rascal Terminal), and import using `import Syntax;`.

## Working with Java bindings
In Rascal, you can bind functions to Java, and therefore use Java libraries. However, this requires a conversion between Java and Rascal values. To convert values between Rascal and Java, we use the library [Vallang](https://github.com/usethesource/vallang).

### Making Vallang available
Vallang is available from the [usethesource maven repository](https://releases.usethesource.io/maven/). This has to be added as a repository to the maven project first in the file `pom.xml` as a child of the `project` node:
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

### Constructing the Java source
Now the Vallang library is available in our Java files. First add a constructor in `src/main/java/com/mycompany/app/App.java` taking an `IValueFactory` object:
```java
package com.mycompany.app;

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

and then add a function `BigIncrement` to the same class:
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

### Constructing the Rascal source
And finally, lets create the binding between Rascal and the Java file we created. Lets do this in a new file `src/RascalJavaBindings.rsc`:
```rascal
module RascalJavaBindings

@javaClass{com.mycompany.app.App}
public java int BigIncrement(int rascal_value);
```
_Note_: This will NOT work if you have opened VS-code with a parent folder of the project. Ensure that `MY-APP` is the root folder opened in VScode (Top of file browser on the left).
Now, in a Rascal terminal `import RascalJavaBindings;` and call it using `BigIncrement(20)`.


Note that conversion of Java exceptions to Rascal exceptions is done using `rascalmpl` instead of Vallang. It can be included as dependency by adding onto `pom.xml`:
```xml
    <dependency>
      <groupId>org.rascalmpl</groupId>
      <artifactId>rascal</artifactId>
      <version>0.23.0</version>
    </dependency>
```

## Using local Java libraries
Based on [this so answer](https://stackoverflow.com/questions/364114/can-i-add-jars-to-maven-2-build-classpath-without-installing-them/7623805#7623805):
1. Add a new local repository to `pom.xml`:
```xml
<repository>
    <id>local-maven-repo</id>
    <url>file://${project.basedir}/local-maven-repo</url>
</repository>
```
2. Install each local jar as artifacts using Maven. Be sure to specify the correct metadata. Note: Do this from the project root folder `my-app/`:
```sh
mvn install:install-file \
  -DlocalRepositoryPath=local-maven-repo \
  -Durl=file:./local-maven-repo/ \
  -DrepositoryId=local-maven-repo \
  -DcreateChecksum=true \
  -DupdateReleaseInfo=true \
  -DgeneratePom=true \
  -Dpackaging=jar \
  -Dfile=[your-jar] \
  -DgroupId=[...] \
  -DartifactId=[...] \
  -Dversion=[...]
```

An example:
```
mvn install:install-file \
  -DlocalRepositoryPath=local-maven-repo \
  -Durl=file:./local-maven-repo/ \
  -DrepositoryId=local-maven-repo \
  -DcreateChecksum=true \
  -DupdateReleaseInfo=true \
  -DgeneratePom=true \
  -Dpackaging=jar \
  -Dfile=./lib/frink.jar \
  -DgroupId=frinklang \
  -DartifactId=frink \
  -Dversion=22.4.18
```

3. Add each installed artifact as dependecy in `pom.xml` using the specified metadata:
```xml
    <dependency>
      <groupId>groupId</groupId>
      <artifactId>artifactId</artifactId>
      <version>version</version>
    </dependency>
```

4. Let Maven download and install the dependencies:
```sh
mvn verify
```

The next step is to specify the location of the installed `.jar` file in `RASCAL.MF`. Right now, this has to be done using a full, absolute path. Note that you therefore cannot copy the following path, but have to adjust it for the location of your project:
```manifest
Require-Libraries: |file:////Users/auke/rascal-lsp-skeletons/my-app/local-maven-repo/frinklang/frink/22.4.18/frink-22.4.18.jar|
```
Multiple libraries can be added by adding addition locations, comma-separated:
```manifest
Require-Libraries: |file:///<location1>|, |file:///<location2>|
```

After this, you can use the functionality provided by the local jar in the Java functions.