library(ggplot2)    
library(ggalluvial) 

data <- read.table("chromHMM_frequency_summary.txt", header=TRUE) 
data <- data.frame(data)

cols <- c("E0"="#C9D3D4","E2"="#FF6F63","E4"="#98B9E5","E5"="#B18DD8","E6"="#FFFF82", "E8"="#FE9BD2")

pdf("ChromHMM_alluvial_plot_fill_STstate_alpha0.7.pdf", width = 10, height = 10, pointsize = 10, bg="transparent")
ggplot(data = data, aes(axis1 = AGSC_state, axis2 = SC_state, axis3 = ST_state, y = number)) +    
scale_x_discrete(limits = c("AGSC_state", "SC_state", "ST_state"), expand = c(.2, .05)) + 
xlab("cell type") + 
ylab("frequency") +
geom_alluvium(aes(fill = ST_state), alpha=0.7) + 
scale_fill_brewer(type = "qual") + 
scale_fill_manual(values=cols) +  
geom_stratum() + 
theme(legend.text = element_text (size = 22),text = element_text(size = 20),panel.background = element_rect(fill = "transparent"),plot.background = element_rect(fill = "transparent", color = NA), panel.grid.major = element_line(size = 0.2, linetype = "solid",
                                colour = "gray"),) +
ggtitle("Concatenated ChromHMM alluvial plot") 
dev.off()
