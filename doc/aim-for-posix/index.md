# Aim for POSIX

We aim for POSIX syntax when possible because we value portability and standardization.

Why use POSIX instead of bash, zsh, fish, etc.?

* We often write scripts that are intended to run a wide range of systems, including many operating systems, many older systems, many third-party systems, and some embedded systems. 

* We value portability and standardization more that using any special bash features; if we need special bash features, this is when we switch to a higher-level language such as python, perl, ruby, go, rust, etc.

* We use the POSIX standard to bring clarity to teamwork, because we have the POSIX standard documentation; we have not found a bash standard yet.

* We like the zsh shell; in practice we find it's just-different-enough that it takes more time to script.

* We love the fish shell; in practice we find it's too-different for heterogeneous teams to use quickly.

Counterpoint: 

* Some companies, such as Google, choose to explicitly write for the bash shell, and explicitly reject the POSIX standard. This can be good for a company, such as Google, that controls all its systems and provides a specific version of bash.

When do we use a higher-level language?

* When write a script that gets too long, or too complex, to easily skim and understand, then we prefer changing from shell to a higher-level language.

* When we need to use arrays for anything more than assignment of `${PIPESTATUS}`, then we prefer using a higher-level language.
