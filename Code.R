library(palmerpenguins)
library(here)
library(tidyverse)
library(janitor)
library(ggplot2)

#write a safe copy of the data - make it read only
write.csv(penguins_raw, here("data", "penguins_raw.csv"))

          
#this step - doing piping is way better than overwriting which can throw errors if you run multiple times

#penguins raw is from palmer penguins
#clean_names fixes messy names
penguins_clean <- penguins_raw %>% 
  select(-Comments) %>% 
  select(-starts_with("Delta")) %>% 
  clean_names() %>% 
  shorten_species()

write.csv(penguins_clean, here("data", "penguins_clean.csv"))


#then she went through how to make a function

#then -> rather then making big long code files -> think about making tools that you can load in (??not sure how)
#so create a functions folder

#now we are loading the functions! !

source(here("functions", "cleaning.R"))

#now learning renv


#renv::init()
#the stags above are done when pressing 


renv::snapshot()

#this loads everything
#renv::restore()

#this installs to environment
#renv::install("your package here")

##my questions
#1. about the subsetted data?
#2. About the functions calling functions

#Wk5!
penguins_clean = read_csv(here("data","penguins_clean.csv"))


#need to remove NA

penguins_flippers  = penguins_clean %>%
  select(c("species", "flipper_length_mm")) %>%
  drop_na()



#change colors
species_colours = c("Adelie" = "darkorange" ,
                   "Chinstrap" = "purple" ,
                   "Gentoo" = "cyan4")



flipper_boxplot = ggplot(
  data = penguins_flippers,
  aes(x = species, y = flipper_length_mm)
) + 
  geom_boxplot(aes(color = species),
               show.legend = FALSE,
               width = 0.3) +
  geom_jitter(aes(color = species), 
                  show.legend = FALSE,
              alpha = 0.3,
              position = position_jitter(width = .2, seed = 0)) +
  scale_color_manual(values = species_colours) +
  labs(x = "Penguin Species",
       y = "Flipper Length (mm)")
#setting the seed means its random but the same random each time!

flipper_boxplot
