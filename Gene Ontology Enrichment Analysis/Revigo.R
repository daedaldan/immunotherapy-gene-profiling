# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0007275","multicellular organism development",1.587,-6.144,-1.695,5.553,-12.175,0.552,0.000),
c("GO:0022610","biological adhesion",0.549,8.094,-1.142,5.092,-6.860,1.000,0.000),
c("GO:0030198","extracellular matrix organization",0.063,-2.178,-6.373,4.150,-14.228,0.955,0.000),
c("GO:0032501","multicellular organismal process",2.455,0.255,-3.560,5.742,-11.979,1.000,0.000),
c("GO:0032502","developmental process",2.243,0.737,0.507,5.703,-12.506,1.000,0.000),
c("GO:0051239","regulation of multicellular organismal process",0.548,4.438,3.651,5.091,-7.336,0.908,0.000),
c("GO:1901700","response to oxygen-containing compound",0.537,4.191,-4.821,5.082,-6.285,0.810,0.000),
c("GO:0042340","keratan sulfate catabolic process",0.000,-3.861,5.734,1.146,-6.303,0.889,0.003),
c("GO:0007155","cell adhesion",0.535,-1.013,-8.144,5.081,-6.914,0.997,0.005),
c("GO:0090304","nucleic acid metabolic process",13.979,-1.302,3.898,6.498,-3.790,0.967,0.083),
c("GO:0110149","regulation of biomineralization",0.020,2.889,4.266,3.645,-4.166,0.928,0.178),
c("GO:2000026","regulation of multicellular organismal development",0.278,4.043,4.965,4.796,-5.359,0.805,0.221),
c("GO:0030574","collagen catabolic process",0.008,-1.984,6.844,3.265,-3.971,0.965,0.223),
c("GO:0050793","regulation of developmental process",1.304,5.112,3.985,5.468,-5.688,0.900,0.257),
c("GO:0048519","negative regulation of biological process",2.519,5.329,3.198,5.753,-3.728,0.894,0.306),
c("GO:0043062","extracellular structure organization",0.064,-1.944,-5.608,4.160,-14.202,0.970,0.329),
c("GO:0071495","cellular response to endogenous stimulus",0.408,4.750,-3.682,4.963,-5.321,0.852,0.334),
c("GO:0044273","sulfur compound catabolic process",0.069,-3.022,6.049,4.189,-4.521,0.937,0.336),
c("GO:0009719","response to endogenous stimulus",0.514,5.105,-4.144,5.063,-5.625,0.879,0.341),
c("GO:0007166","cell surface receptor signaling pathway",0.845,4.843,-0.169,5.279,-4.054,0.780,0.358),
c("GO:0045229","external encapsulating structure organization",1.078,-1.813,-4.624,5.385,-14.151,0.966,0.408),
c("GO:0050789","regulation of biological process",21.130,4.854,3.343,6.677,-3.815,0.877,0.435),
c("GO:0007167","enzyme linked receptor protein signaling pathway",0.216,4.961,-0.524,4.687,-4.287,0.803,0.456),
c("GO:0006026","aminoglycan catabolic process",0.232,-3.246,5.804,4.717,-4.044,0.874,0.509),
c("GO:0006939","smooth muscle contraction",0.013,-6.476,-0.391,3.455,-4.783,0.775,0.551),
c("GO:1901698","response to nitrogen compound",0.235,3.934,-4.966,4.723,-3.947,0.822,0.585),
c("GO:0045667","regulation of osteoblast differentiation",0.022,3.449,5.496,3.704,-4.394,0.870,0.600),
c("GO:0001503","ossification",0.045,-6.164,-0.048,4.003,-4.054,0.757,0.610),
c("GO:1901701","cellular response to oxygen-containing compound",0.391,4.318,-4.371,4.945,-5.987,0.797,0.613),
c("GO:0042339","keratan sulfate metabolic process",0.001,-4.333,5.293,2.097,-4.467,0.898,0.628),
c("GO:0048705","skeletal system morphogenesis",0.057,-5.871,-1.803,4.112,-4.644,0.602,0.659),
c("GO:0001822","kidney development",0.060,-6.074,-1.134,4.127,-4.471,0.598,0.661),
c("GO:0010033","response to organic substance",0.953,4.389,-4.768,5.331,-5.238,0.801,0.668),
c("GO:0001655","urogenital system development",0.070,-5.840,-1.261,4.195,-3.924,0.618,0.670),
c("GO:0061061","muscle structure development",0.111,-5.696,-3.114,4.397,-4.105,0.651,0.699),
c("GO:0001501","skeletal system development",0.113,-6.037,-1.511,4.405,-9.854,0.606,0.700));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("/path_to_your_file/revigo-plot.pdf");

