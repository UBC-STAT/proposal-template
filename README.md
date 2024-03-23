# ADA Report and Thesis Proposal Template

This is a LaTeX template for ADA reports and thesis proposals in the Department
of Statistics & Data Science, Carnegie Mellon University. The Department does
not have strict formatting requirements, so use of this template is optional,
but it is a convenient way to format your work.

This template was created by Alex Reinhart.

To use this template, you can either:

- Make a copy of this repository under your own GitHub account by pressing the
  green "Use this template" button. Then you can clone the repository to your
  computer and work in it like any other Git repository.
- In the Releases section on the GitHub page for this template, download a Zip
  file containing the template. You can work on these on your computer or upload
  them to Overleaf.

Once you have the template on your computer, open `proposal.tex` and follow the
instructions inside.

## Reproducible reports with embedded R code

If you'd like to make a reproducible report with R code embedded inside, the
[knitr](https://yihui.org/knitr/) package supports R code in LaTeX files. This
works much like R Markdown, but entirely within LaTeX. RStudio supports this
format and can automatically generate a PDF from the source code.

Save `proposal.tex` as `proposal.Rnw` and open it in RStudio. R code chunks can
be written like this:

```
<<chunk-name>>=
#| echo: FALSE
#| fig.cap: "Caption for your figure"
#| fig.width: 6
#| fig.height: 4
# Your R code goes here
library(ggplot2)

ggplot(cars, aes(x = speed, y = dist)) +
  geom_point()
@
```

This chunk generates a figure. This is automatically turned into a numbered
figure in LaTeX, and you can refer to it as `Figure \ref{fig:chunk-name}`. There
are a variety of [chunk options available](https://yihui.org/knitr/options/)
that can be used to control how the figure is shown, though note the
documentation shows the syntax for R Markdown, not for LaTeX. In LaTeX, options
can be used as shown above.
