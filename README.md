# Home Schooling Dashboard in the United States

## Overview
This Shiny dashboard presents insights into home-school enrollment data collected by The Washington Post from individual school districts and states in the United States. The dataset spans from the academic year 2017-18 through 2022-23.

## Data Source
The original dataset is compiled by [The Washington Post](https://www.washingtonpost.com/) and is publicly available on [GitHub](https://github.com/washingtonpost/data_home_schooling/). The Washington Post also provides its own visualizations and reporting, which can be accessed [online here](https://www.washingtonpost.com/education/interactive/2023/homeschooling-growth-data-by-district/).

## Technologies Used
- **Shiny Framework**: The interactive web application is built using the [Shiny framework](http://shiny.rstudio.com/) for the R programming language.
- **Flexdashboard Package**: The layout of the dashboard is created with the [flexdashboard](http://rstudio.github.io/flexdashboard/index.html) package.
- **Charting Libraries**:
  - [Plotly](http://plot.ly): Used to convert ggplot charts to interactive plots.
  - [Highcharts](http://www.highcharts.com/): Utilized for creating interactive bar charts.
  - [ggplot2](http://ggplot2.org/): Used for creating static and non-interactive charts.

## Application Structure
The dashboard is organized into sections:

### Home schooled children over the years
- Line chart displaying the total number of homeschooled children over the years.

### Top 5 states with highest homeschooling
- Bar chart showing the total number of homeschooled children for the top 5 states.

### Homeschooled children by School Districts for a given State
- Column chart dynamically updated based on user-selected state and school district. It displays the number of homeschooled children for the selected district over the available years.

## How to Use
1. **Select State**: Use the dropdown menu to select a state.
2. **Select School District**: After selecting a state, the dropdown menu for school districts will be dynamically updated. Choose a school district.
3. **Interactive Charts**: The selected charts will dynamically update based on your choices.

## Data Attribution
- Original Data Source: [The Washington Post on GitHub](https://github.com/washingtonpost/data_home_schooling/)

Feel free to explore the data, visualize trends, and gain insights into the homeschooling landscape in the United States. If you have any questions or feedback, please don't hesitate to reach out on [this](sohambhagwat2@gmail.com) email.
