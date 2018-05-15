# Aim for POSIX when possible

Summary: Use POSIX when possible because of portability and standardization.

Why use POSIX instead of bash, zsh, fish, etc.?

* We often write scripts that are intended to run a wide range of systems, including many operating systems, many older systems, many third-party systems, and some embedded systems. 

* We value portability and standardization more that using any special bash features; if we need special bash features, this is when we switch to a higher-level language such as python, perl, ruby, go, rust, etc.

* We use the POSIX standard to bring clarity to teamwork, because we have the POSIX standard documentation; we have not found a bash standard yet.

* We like the zsh shell; in practice we find it's just-different-enough that it takes more time to script.

* We love the fish shell; in practice we find it's too-different for heterogeneous teams to use quickly.

* Counterpoint: some companies, such as Google, choose to explicity write for the bash shell, and explicity reject the POSIX standard; this is good for Google because Google controls all its systems, and provides a specific version of bash, so the Google engineers know the target system specifics.

When to use a higher-level language?

* If we need to use arrays for anything more than assignment of ${PIPESTATUS}, we use a higher-level language.

* If you are writing a script that is more than 100 lines long, you should probably be writing it in a higher-level language instead. Bear in mind that scripts grow. Rewrite your script in a higher-level language early to avoid a time-consuming rewrite at a later date.


