#setwd("D:/DATA SCIENCE/9.Developing data products/Course project/Shiny app")

library(shiny)

shinyUI(
    
    pageWithSidebar(
    
        headerPanel("Reliability Prediction"),
        
        sidebarPanel(
            
            numericInput('strength_mean', 'Mean Strength (MPa)', 500, min = 300, max = 1000, step = 100),
            numericInput('strength_sd', 'Std dev of Strength (MPa)', 50, min = 5, max = 50, step = 5),
            numericInput('stress_mean', 'Mean Stress (MPa)', 300, min = 100, max = 500, step = 50),
            numericInput('stress_sd', 'Std dev of Stress (MPa)', 60, min = 5, max = 50, step = 5),
            
            #numericInput('ht', 'Height in cm', 150, min = 120, max = 200, step = 5),
            
            submitButton('Submit')
            
            
        ),
        
        mainPanel(
            
            h3('Your input parameters are as below'),
            
            h4('Mean strength (MPa) entered'),
            verbatimTextOutput("strengthmean"),
            
            h4('Standard deviation of strength (MPa) entered'),
            verbatimTextOutput("strengthsd"),
            
            h4('Mean stress (MPa) entered'),
            verbatimTextOutput("stressmean"),
            
            h4('Standard deviation of stress (MPa) entered'),
            verbatimTextOutput("stresssd"),
            
            
            h3('Reliability prediction based on your input data is'),
            verbatimTextOutput("Reliability"),
            
            h3('Probability of failure based on your input data is'),
            verbatimTextOutput("Proboffail"),
            
            plotOutput("Densplot"),
            
            h2('Documentation'),
            
            h4('When pressure or force is applied on a component, it induces stress in the component. More the applied force, more will be the stress.'),  
            h4('Strength is a material property and this is unique for perticular material.'),
            h4('If induced stress in component is more than material strength then component will fail and will not be able to perform its intended function.'),  
            h4('Reliability is the ability of a component/machine/system to perform its intended function for specified time under predefined conditions.'),
            h4('Stregth and stresses are assumed to have normal distribution.'),  
            h4('If we plot distribution of strength and stress then the overlapping or common area between these two curves gives the probability of failure. Reliability, also called probability of component to perform without any failure is given by (1-probability of failure).'),
            h4('In boxes provided enter mean of the material strength, standard deviation strength,
               mean of the stress, standard deviation of the stress'),
            h4('Once all inputs are entered, hit submit button. You can see calculated value of Reliability, Probability of failure and plot with distribution of stress strength on the right side.')
            
        )

        
))