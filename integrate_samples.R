library(Seurat)
library(SeuratObject)

#read the list with samples
obj_to_integrate <- readRDS("../list_filtered_seurat_Song_2022.rds")

#merge samples
merged_seurat <- merge(obj_to_integrate[[1]], obj_to_integrate[-1])
merged_seurat

#split into layers by sample source
merged_seurat[["RNA"]] <- split(merged_seurat[["originalexp"]], f = merged_seurat$sample_source)
DefaultAssay(merged_seurat) <- "RNA"
merged_seurat <- NormalizeData(merged_seurat)
merged_seurat <- FindVariableFeatures(merged_seurat)
merged_seurat <- ScaleData(merged_seurat)
merged_seurat <- RunPCA(merged_seurat)

ElbowPlot(merged_seurat, ndims = 30)
merged_seurat <- FindNeighbors(merged_seurat, dims = 1:30, reduction = "pca")

merged_seurat <- FindClusters(merged_seurat, resolution = 2, cluster.name = "unintegrated_clusters")
merged_seurat <- RunUMAP(merged_seurat, dims = 1:30, reduction = "pca", reduction.name = "umap.unintegrated")
DimPlot(merged_seurat, reduction = "umap.unintegrated", group.by = c("sample_source", "unintegrated_clusters"))

#### integrate samples ####
#merged_seurat <- FindVariableFeatures(merged_seurat)
merged_seurat <- IntegrateLayers(
  object = merged_seurat, method = CCAIntegration,
  orig.reduction = "pca", new.reduction = "integrated.cca",
  verbose = FALSE, assay = "RNA"
)

merged_seurat <- FindNeighbors(merged_seurat, reduction = "integrated.cca", dims = 1:30)
merged_seurat <- FindClusters(merged_seurat, resolution = 2, cluster.name = "cca_clusters")
merged_seurat <- RunUMAP(merged_seurat, reduction = "integrated.cca", dims = 1:30, reduction.name = "umap.cca")
DimPlot(
  merged_seurat,
  reduction = "umap.cca",
  group.by = c("sample_source",  "cca_clusters")
)
DimPlot(merged_seurat, reduction = "umap.unintegrated", group.by = c("cca_clusters"))
