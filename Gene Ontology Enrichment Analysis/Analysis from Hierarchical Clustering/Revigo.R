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
revigo.data <- rbind(c("GO:0001503","ossification",0.045,6.437,2.765,4.003,-3.987,0.753,0.000),
c("GO:0009653","anatomical structure morphogenesis",0.911,6.755,-0.294,5.311,-12.390,0.520,0.000),
c("GO:0022610","biological adhesion",0.549,3.329,7.567,5.092,-7.863,1.000,0.000),
c("GO:0030198","extracellular matrix organization",0.063,-4.559,-4.107,4.150,-16.040,0.944,0.000),
c("GO:0032501","multicellular organismal process",2.455,0.945,-2.400,5.742,-10.613,1.000,0.000),
c("GO:0032502","developmental process",2.243,2.928,5.572,5.703,-12.693,1.000,0.000),
c("GO:0051239","regulation of multicellular organismal process",0.548,-2.060,6.162,5.091,-6.208,0.908,0.000),
c("GO:0042340","keratan sulfate catabolic process",0.000,2.237,-6.290,1.146,-6.654,0.880,0.003),
c("GO:0007155","cell adhesion",0.535,5.125,6.820,5.081,-7.921,0.997,0.005),
c("GO:0032963","collagen metabolic process",0.015,-0.156,1.118,3.530,-3.638,0.991,0.014),
c("GO:1901360","organic cyclic compound metabolic process",22.951,-2.031,-1.082,6.713,-4.319,0.976,0.032),
c("GO:0006725","cellular aromatic compound metabolic process",22.223,-6.386,0.345,6.699,-4.159,0.972,0.111),
c("GO:0046483","heterocycle metabolic process",22.176,-5.089,0.323,6.698,-4.004,0.972,0.167),
c("GO:0034641","cellular nitrogen compound metabolic process",26.813,-5.661,-0.695,6.780,-4.078,0.961,0.178),
c("GO:0110149","regulation of biomineralization",0.020,-1.878,4.265,3.645,-4.614,0.927,0.178),
c("GO:0017015","regulation of transforming growth factor beta receptor signaling pathway",0.026,-0.145,6.888,3.771,-3.983,0.904,0.182),
c("GO:0007167","enzyme linked receptor protein signaling pathway",0.216,-3.746,4.703,4.687,-4.255,0.901,0.216),
c("GO:0006029","proteoglycan metabolic process",0.032,0.111,-6.663,3.857,-3.932,0.933,0.217),
c("GO:2000026","regulation of multicellular organismal development",0.278,-1.502,5.706,4.796,-6.082,0.789,0.221),
c("GO:0030574","collagen catabolic process",0.008,4.790,-5.930,3.265,-4.303,0.961,0.223),
c("GO:0050793","regulation of developmental process",1.304,-1.461,6.594,5.468,-5.544,0.901,0.257),
c("GO:0009719","response to endogenous stimulus",0.514,-5.691,3.241,5.063,-3.654,0.991,0.314),
c("GO:0043062","extracellular structure organization",0.064,-4.048,-4.081,4.160,-16.013,0.960,0.329),
c("GO:0044273","sulfur compound catabolic process",0.069,3.721,-6.132,4.189,-4.921,0.931,0.336),
c("GO:0045229","external encapsulating structure organization",1.078,-4.030,-4.667,5.385,-15.959,0.953,0.408),
c("GO:0006024","glycosaminoglycan biosynthetic process",0.793,0.510,-6.204,5.251,-4.480,0.872,0.469),
c("GO:0097435","supramolecular fiber organization",0.308,-3.665,-4.573,4.841,-4.225,0.956,0.470),
c("GO:0060021","roof of mouth development",0.017,6.553,-0.811,3.577,-3.854,0.632,0.571),
c("GO:0072006","nephron development",0.028,6.464,1.102,3.794,-4.804,0.561,0.593),
c("GO:0045667","regulation of osteoblast differentiation",0.022,-2.877,5.846,3.704,-4.900,0.858,0.600),
c("GO:0060173","limb development",0.038,6.218,0.703,3.928,-3.799,0.591,0.608),
c("GO:0048736","appendage development",0.050,6.929,0.715,4.052,-3.799,0.584,0.622),
c("GO:0061448","connective tissue development",0.051,6.780,-0.583,4.063,-4.126,0.597,0.623),
c("GO:0042339","keratan sulfate metabolic process",0.001,1.616,-6.369,2.097,-4.807,0.889,0.628),
c("GO:0048705","skeletal system morphogenesis",0.057,6.727,0.460,4.112,-5.309,0.543,0.629),
c("GO:0001501","skeletal system development",0.113,6.723,0.949,4.405,-10.548,0.552,0.666),
c("GO:0048598","embryonic morphogenesis",0.168,6.457,0.377,4.576,-3.971,0.539,0.690));

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

