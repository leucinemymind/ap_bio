

# our plants

parent_heights_sample <- c(2.9, 3.1, 5.9, 5.3, 8, 3.4, 5.2, 4.7, 0.4)
f1_heights_sample <- c(5.1,2.3,5,3.5,5.1,9.1,3.3,3.4,4.3,7.3,7.4,7.5,5.5)

# everyone's plants

parent_heights_all <- c(parent_heights_sample, 9.3, 10.5, 4.8, 8.8, 9.3, 7.5, 9.8, 8.7, 4, 9.4, 7.3, 5.3, 5.1, 5.3, 9.4, 4.5, 3.5, 8.5, 0.4, 6.5, 6, 7.6, 0.7, 7.5, 9, 9.9, 11, 7.9, 9.2, 6.4, 9.6, 6.8, 8.2, 5.5, 6.6, 7.9)

# histogram

hist(parent_heights_all)

# difference?

t.test(parent_heights_sample, f1_heights_sample)

# mean + SEM

df <- data.frame(
  group = c(rep("Parent", length(parent_heights_sample)),
            rep("F1", length(f1_heights_sample))),
  value = c(parent_heights_sample, f1_heights_sample)
)

ggplot(df, aes(x = group, y = value)) +
  stat_summary(fun = mean, geom = "point", size = 3) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  stat_summary(fun = mean, geom = "crossbar", width = 0.5) +
  labs(
    title = "Mean heights of parent vs F1 (± SEM)",
    x = "",
    y = "Height"
    ) + 
  theme_minimal()