runAtac <- function(atac.bds, r1, r2, genome.build, para){
	cmd <- paste0("bds ", atac.bds, 
		" -species ", genome.build, 
		" -nth ", para,
		" -fastq1_1 ", r1,
		" -fastq1_2 ", r2)
	system(cmd)
}