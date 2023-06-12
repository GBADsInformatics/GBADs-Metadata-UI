ui <- fluidPage(
  
  # Theming -----------------------------------------------------------------
  use_googlefont("Raleway"),
  use_theme(create_theme(bs_vars_font(family_sans_serif = "'Raleway'"))),
  setBackgroundColor(
    color = c("#F7F7F7", "#F7F7F7"),
    gradient = "linear",
    direction = "bottom"
  ),
  windowTitle = "GBADs Data Portal",
  
  # Header ------------------------------------------------------------------
  fluidRow(
    column(12,img(src ="GBADsLogo.png", height = "70px", style = "padding-left: 12px; padding-top:15px; padding-bottom: 0px")),
    column(12,h2("Data Portal", style = "padding-left: 16px; margin-top:0px; color: #333333;")),style = "background-color: #fff"),
  fluidRow(
    column(12,style='padding-bottom:1px; background-color:#F0F0F0;box-shadow: 3px 3px 3px 3px #F3F3F3;')
  ),
  fluidRow(
    column(12,style='padding-bottom:1px')
  ),
  fluidRow(
    column(12,br()),
    column(2,selectizeInput("country_select","Country",c("Global","Ethiopia"), width = '100%')),
    column(2,selectizeInput("species_select","Species",c("Poultry","Goats","Camels"), width = '100%')),
    column(2,br(),actionBttn("search_btn","Search", color = "warning", size = "s", icon = icon("search"))),
    style = 'background-color:white'
  ),
  fluidRow(
    column(12,style='padding-bottom:1px; background-color:#F0F0F0;box-shadow: 3px 3px 3px 3px #F3F3F3;')
  ),
  fluidRow(
    column(12,uiOutput("tables_count"), style = 'padding-left:30px')
  ),
  
  
  # Sidebar -----------------------------------------------------------------
  sidebarLayout(
    sidebarPanel(
      uiOutput("tables_list"),
      tags$style(".well {background-color:white;border-color: white; box-shadow: 3px 3px 3px 3px #F3F3F3; height: 720px; border-radius: 20px; overflow-y: auto;}")
    ),
    
    
    # Main Panel --------------------------------------------------------------
    mainPanel(
      
      # Metadata Panel ----------------------------------------------------------
      fluidRow(
        column(12,
               wellPanel(
                 h4("dataset_name_placeholder", style = "color: orange; font-weight: bold"), 
                 hr(style = "color: #F2F2F2; margin-bottom: 0px"),
                 fluidRow(
                   column(5,
                          h5("Creator:", style = 'font-weight: bold'),
                          h5("PLACEHOLDER"),
                          h5("Time Interval:", style = 'font-weight: bold'),
                          h5("PLACEHOLDER"),
                          h5("Geographic Relevance:", style = 'font-weight: bold'),
                          h5("PLACEHOLDER")
                   ),
                   column(5,
                          h5("Species Included:", style = 'font-weight: bold'),
                          h5("PLACEHOLDER"),
                          h5("Description:", style = 'font-weight: bold'),
                          h5("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                   )
                 ),
                 fluidRow(
                   column(12, align = 'right',
                          actionBttn("md_dl_btn","Download Metadata", color = "primary", size = "s", icon = icon('download')),
                          actionBttn("preview_btn","Preview Data", color = "primary", size = "s", icon = icon('table'))
                   )
                 ),
                 style = 'height:300px; width: 100%; border-radius: 20px'
               )
        )
      ),
      
      # Data preview panel ------------------------------------------------------
      fluidRow(
        column(12,
               wellPanel(
                 column(12,
                        dataTableOutput("data_preview")
                 ),
                 column(12, style = 'margin-bottom: 20px'),
                 column(12, align = 'right',
                        actionBttn("dt_dl_btn","Download .csv", color = "primary", size = "s", icon = icon('download')),
                        actionBttn("cpy_url_btn","Copy URL", color = "primary", size = "s", icon = icon('copy'))
                 ),
                 style = 'height:400px; width: 100%; border-radius: 20px'
               )
        )
      )
    )
  )
  
)
