library(ggplot2)


# Step 1: Input your updated data
# Replace the data.frame below with your updated dataset
data <- data.frame(
  Relative_Age = c(1,2,3,4,5,6,7,8,9,10), ## Replace with your Relative
  ln_N_Delta_t = c(4.79, 4.61, 4.44, 4.25, 4.09, 3.91, 3.69, 3.40, 3.00, 2.30) ## Replace with your ln(N/Δt)
)

# Step 2: Add a column to classify points based on Relative_Age
data$Fish_Type <- ifelse(data$Relative_Age <= 2.5, "Young Fish", "Old Fish")


# Step 3: Plot the Length-Converted Catch Curve with Conditional Coloring and Legend

ggplot(data, aes(Relative_Age, ln_N_Delta_t)) +
  geom_point(aes(fill = Fish_Type), color = "black", shape = 21, size = 4, stroke = 1) + 
  geom_smooth(method = "lm", color = "black", size = 1, se = FALSE) +
  labs(
    title = "Length-Converted Catch Curve",
    x = "Relative age (years - t0)",
    y = "ln(N / Δt)"
  ) +
  scale_fill_manual(values = c("Young Fish" = "yellow", "Old Fish" = "black")) + #define fill color and labels
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white", color = "black"), # White background with black border
    panel.grid.major = element_line(color = "gray80"),                # Light gray grid lines
    panel.grid.minor = element_blank(),                               # Remove minor grid lines
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"), # Center and style the title
    axis.title = element_text(size = 12),                             # Style axis titles
    legend.title = element_text(size = 12),                           # Style legend title
    legend.text = element_text(size = 10),                            # Style legend text
  )

# Step 4: Fit a linear model to calculate Z (Total Mortality Rate)

lm_model <- lm(ln_N_Delta_t ~Relative_Age, data = data)
summary(lm_model)  

# Extract the slope (Z) from the linear model
Z <- abs(coef(lm_model)["Relative_Age"])
cat("Estimated Total Mortality (Z):", Z, "\n")  
  
  
ggsave("Length_converted_catch_curve_2.pdf", dpi = 1000)


  
  
  