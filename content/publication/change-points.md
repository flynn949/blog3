+++
title = "Detection of kinetic change points in piece-wise linear single molecule motion"
date = 2018-01-01T00:00:00
draft = false

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["Flynn R. Hill", "Antoine M. van Oijen", "Karl E. Duderstadt"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference paper
# 2 = Journal article
# 3 = Manuscript
# 4 = Report
# 5 = Book
# 6 = Book section
publication_types = ["2"]

# Publication name and optional abbreviated version.
publication = "The Journal of Chemical Physics"

# Abstract and optional shortened version.
abstract = "Single-molecule approaches present a powerful way to obtain detailed kinetic information at the molecular level. However, the identification of small rate changes is often hindered by the considerable noise present in such single-molecule kinetic data. We present a general method to detect such kinetic change points in trajectories of motion of processive single molecules having Gaussian noise, with a minimum number of parameters and without the need of an assumed kinetic model beyond piece-wise linearity of motion. Kinetic change points are detected using a likelihood ratio test in which the probability of no change is compared to the probability of a change occurring, given the experimental noise. A predetermined confidence interval minimizes the occurrence of false detections. Applying the method recursively to all sub-regions of a single molecule trajectory ensures that all kinetic change points are located. The algorithm presented allows rigorous and quantitative determination of kinetic change points in noisy single molecule observations without the need for filtering or binning, which reduce temporal resolution and obscure dynamics. The statistical framework for the approach and implementation details are discussed. The detection power of the algorithm is assessed using simulations with both single kinetic changes and multiple kinetic changes that typically arise in observations of single-molecule DNA-replication reactions. Implementations of the algorithm are provided in ImageJ plugin format written in Java and in the Julia language for numeric computing, with accompanying Jupyter Notebooks to allow reproduction of the analysis presented here."
 abstract_short = "Single-molecule approaches present a powerful way to obtain detailed kinetic information at the molecular level. However, the identification of small rate changes is often hindered by the considerable noise present in such single-molecule kinetic data. We present a general method to detect such kinetic change points in trajectories of motion of processive single molecules having Gaussian noise, with a minimum number of parameters and without the need of an assumed kinetic model beyond piece-wise linearity of motion."

# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
selected = true

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's filename without extension.
#   E.g. `projects = ["deep-learning"]` references `content/project/deep-learning.md`.
#   Otherwise, set `projects = []`.
projects = []

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []

# Links (optional).
#url_pdf = "https://aip.scitation.org/doi/abs/10.1063/1.5009387"
#url_preprint = "#"
url_code = "https://github.com/duderstadt-lab/Julia_KCP_Notebooks"
#url_dataset = "#"
#url_project = "#"
#url_slides = "#"
#url_video = "#"
#url_poster = "#"
#url_source = "#"

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
url_custom = [{name = "html", url = "https://aip.scitation.org/doi/abs/10.1063/1.5009387"}]

# Does this page contain LaTeX math? (true/false)
math = true

# Does this page require source code highlighting? (true/false)
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = "panelF.png"
caption = "An example of multiple change point detection"

+++

#More detail can easily be written here using *Markdown* and $\rm \LaTeX$ math code.
