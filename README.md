# Coalition Analysis (KOALA) 2017
Slides presented at AppliedR MeetUp September 20th, 2017

- Rendered slides: [https://adibender.netlify.com/slides/appliedr-slides#1](https://adibender.netlify.com/slides/appliedr-slides#1)
- Analyses are based on the [`coalitions`](https://adibender.github.io/coalitions/) package.
- Shiny App: [http://koala.stat.uni-muenchen.de/](http://koala.stat.uni-muenchen.de/)
- Updates on Twitter: [@KOALA_LMU](https://twitter.com/KOALA_LMU)


### Workflow to rebuild slides from `.Rmd` file

- install xaringan and coalitions packages:
```r
devtools::install_github('yihui/xaringan')
devtools::install_github('adibender/coalitions')
```

- Host site on local server + continuous preview:
```r
xaringan::infinite_moon_reader("appliedR-slides.Rmd")
```


### xaringan/remark.js sources

- [https://slides.yihui.name/xaringan/#1](https://slides.yihui.name/xaringan/#1)
- [https://remarkjs.com/#1](https://remarkjs.com/#1)
