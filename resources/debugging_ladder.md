# Debugging ladder

When R code breaks, climb the ladder instead of rewriting everything.

1. Reproduce the error.
2. Read the first error message slowly.
3. Identify the exact line that failed.
4. Inspect the objects used on that line with `str()`, `glimpse()`, `names()`, and `head()`.
5. Test the smallest assumption.
6. Make the smallest fix.
7. Rerun the line, then rerun the surrounding block.
8. Write a comment explaining what changed.

Good AI debugging prompt:

> I am a beginning R user. This code gives the error below. Please explain the error, ask me what object or column names I should inspect, and suggest the smallest fix. Do not rewrite the entire script.
