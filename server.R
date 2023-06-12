
function(input, output, session) {

# Count of data tables available -------------------------------------------
output$tables_count <- renderUI({
  h5(paste(nrow(tables),"results found.", sep = " "),style = 'color: blue; font-style: italic;')
})

#Create sidebar list of tables--------------------  
  output$tables_list <- renderUI({
    ui_elements <- list()
    for (i in 1:nrow(tables)) {
      ui_row <- list(
        tags$a(
          href = "#",
          h4(paste(tables$names[i]), style = "color: orange; font-weight: bold")
        ),
        h5(paste(tables$desc[i]), style = 'color: grey'),
        hr(style = "color: #F2F2F2; margin-bottom: 0px")
      )
      ui_elements <- append(ui_elements, ui_row)
    }
    do.call(tagList, ui_elements)
  })


# Render data preview -----------------------------------------------------
  output$data_preview <- renderDataTable(iris,
                                         options = list(
                                           pageLength = 5
                                         )
  )

}
