runAtac <- function(atac.bds, r1, r2, genome.build, para, samp.name){
	out.dir <- paste0(samp.name, '_atac/')
	dir.create(out.dir)
	setwd(out.dir)
	cmd <- paste0("bds ", atac.bds, 
		" -species ", genome.build, 
		" -nth ", para,
		" -fastq1_1 ", r1,
		" -fastq1_2 ", r2)
	system(cmd)
}
atac.bds <- "/home/ubuntu/Documents/Github/atac_dnase_pipelines/atac.bds"  
base.dir <- '/home/ubuntu/Documents/MiSeqRuns/170726-M03805-0207-000000000-B9PC3/'
for(i in 1:length(ss$Sample_ID)){
	print(i)
	setwd(base.dir)
	runAtac(atac.bds=atac.bds,
		r1=paste0(base.dir, 'fastq/', ss$Sample_ID[i], '_S',i,"_L001_R1_001.fastq.gz"),
		r2=paste0(base.dir, 'fastq/', ss$Sample_ID[i], '_S',i,"_L001_R2_001.fastq.gz"),
		genome.build='hg38',
		para=32,
		samp.name=ss$Sample_ID[i])
}