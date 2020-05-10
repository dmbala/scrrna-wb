# Building an Interactive Workbench for Single Cell Genomics 
Repo for building an interactive workbench for scRNA analysis. The interactive workbench is built with Open OnDemand service. The analysis are performed with cellranger pipeline and scanpy.

<img src="https://github.com/dmbala/scrrna-wb/blob/master/Figs/scrna-infrastructure-1.jpg">
[Workbench model for scRNA analysis ](https://github.com/dmbala/scrrna-wb/blob/master/Figs/scrna-infrastructure-1.jpg)
<img src="https://github.com/dmbala/scrrna-wb/blob/master/Figs/scrna-infrastructure-4a.jpg">
[Workflow for scRNA analysis ](https://github.com/dmbala/scrrna-wb/blob/master/Figs/scrna-infrastructure-4a.jpg)


* Jobwrappers (contains job wraper script to run cellranger and jupyter scanpy notebook)
  * cellranger_aggr.sh    
  * cellranger_bcl2count.sh
  * cellranger_mkfastq.sh
  * scanpy-scrna-analysis.ipynb

* OOD_app (OOD app that presents three web forms on the dashboard)
  * cellranger_aggr
  * cellranger_bcl2count
  * cellranger_bcl2fastq


============================================

List of Scientific  Workflow Management Systems

============================================


See here:  https://github.com/pditommaso/awesome-pipeline, https://github.com/common-workflow-language/common-workflow-language/wiki/Existing-Workflow-systems

* Apache Airflow https://github.com/apache/airflow
* NextFlow http://nextflow.io
* Makeflow http://ccl.cse.nd.edu/software/makeflow/
* Pyflow https://github.com/Illumina/pyflow
* Cluster Flow http://clusterflow.io
* Pegasus http://pegasus.isi.edu/
* Parsl (a Parallel Scripting Library for Python) http://parsl-project.org
* Swift & Swift/T http://swift-lang.org/main/ http://swift-lang.org/Swift-T/
* Galaxy http://galaxyproject.org/
* Apache Taverna http://www.taverna.org.uk/ https://taverna.incubator.apache.org/
* Kepler https://kepler-project.org/
* flowr (R-based) http://docs.flowr.space/ https://github.com/sahilseth/flowr
* Arvados - CWL-based distributed computing platform for data analysis on massive data sets.https://arvados.org/ https://github.com/arvados/arvados
* SHIWA https://www.shiwa-workflow.eu/
* Apache Oozie https://oozie.apache.org/
* DNANexus https://wiki.dnanexus.com/API-Specification-v1.0.0/IO-and-Run-Specifications https://wiki.dnanexus.com/API-Specification-v1.0.0/Workflows-and-Analyses
* Agave http://agaveapi.co/live-docs/
* DiscoveryEnvironment http://www.iplantcollaborative.org/ci/discovery-environment
* Wings http://www.wings-workflows.org/
* Knime https://www.knime.org/
* Snakemake https://github.com/snakemake/snakemake https://snakemake.readthedocs.io/en/stable/
* BPipe http://bpipe.org http://docs.bpipe.org/
* Ruffus https://code.google.com/p/ruffus/
* Luigi http://github.com/spotify/luigi https://luigi.readthedocs.io
* SciLuigi. Helper library built on top of Luigi to ease development of Scientific workflows in Luigi: http://github.com/pharmbio/sciluigi
* Luigi Analysis Workflow (LAW) https://github.com/riga/law
* GATK Queue https://www.broadinstitute.org/gatk/guide/topic?name=queue
* Yabi https://ccg.murdoch.edu.au/yabi
* Ketrew https://github.com/hammerlab/ketrew
* Cosmos https://cosmos.hms.harvard.edu/documentation/index.html http://bioinformatics.oxfordjournals.org/content/early/2014/07/24/bioinformatics.btu385.full [paper] Cosmos2: https://github.com/LPM-HMS/COSMOS2 http://cosmos.hms.harvard.edu/COSMOS2/
* Pinball https://github.com/pinterest/pinball
* bcbio https://bcbio-nextgen.readthedocs.org/en/latest/
* Chronos https://github.com/mesos/chronos
* Azkaban https://azkaban.github.io/
* Apache NiFi https://nifi.apache.org/docs/nifi-docs/html/overview.html
* Mistral https://github.com/arteria-project https://wiki.openstack.org/wiki/Mistral#What_is_Mistral.3F https://docs.openstack.org/mistral/latest/user/wf_lang_v2.html
* nipype http://nipy.org/nipype/
* End of Day https://github.com/joestubbs/endofday
* BioDSL https://github.com/maasha/BioDSL
* BigDataScript http://pcingola.github.io/BigDataScript/
* Omics Pipe: uses Ruffus http://sulab.scripps.edu/omicspipe/
* Ensembl Hive https://github.com/Ensembl/ensembl-hive
* QuickNGS http://bifacility.uni-koeln.de/quickngs/web
* GenePattern http://www.broadinstitute.org/cancer/software/genepattern/
* Chipster http://chipster.csc.fi/
* The Genome Modeling System https://github.com/genome/gms
* Cuneiform, A Functional Workflow Language https://github.com/joergen7/cuneiform http://www.cuneiform-lang.org/
* Anvaya http://www.ncbi.nlm.nih.gov/pubmed/22809419 http://webapp.cabgrid.res.in/biocomp/Anvaya/ANVAYA_Main.html#HOWTO_INSTALL_ANVAYA
* Apache Airavata http://airavata.apache.org/
* Unipro UGENE http://ugene.net/ https://doi.org/10.7717/peerj.644
* CloudSlang http://www.cloudslang.io/
* Stacks http://catchenlab.life.illinois.edu/stacks/
* Leaf http://www.francesconapolitano.it/leaf/index.html
* omictools http://omictools.com/
* YAWL yet another workflow language https://doi.org/10.1016/j.is.2004.02.002 http://www.yawlfoundation.org/
* Triquetrum https://projects.eclipse.org/projects/technology.triquetrum https://github.com/eclipse/triquetrum/
* Kronos https://github.com/jtaghiyar/kronos
* qsubsec https://github.com/alastair-droop/qsubsec https://doi.org/10.1093/bioinformatics/btv698 
* YesWorkflow http://yesworkflow.org
* gwf - Grid WorkFlow https://github.com/gwforg/gwf http://gwf.readthedocs.io/
* Fireworks. https://pythonhosted.org/FireWorks/
* NGLess: NGS with less work http://ngless.rtfd.io
* pypipegraph https://github.com/TyberiusPrime/pypipegraph
* Cromwell https://github.com/broadinstitute/cromwell
* Dagobah - Simple DAG-based job scheduler in Python. https://github.com/thieman/dagobah
* sushi https://github.com/uzh/sushi
* Clinical Trial Processor - A program for processing clinical trials data.  http://mircwiki.rsna.org/index.php?title=MIRC_CTP
* Noodles http://nlesc.github.io/noodles/
* Consonance (runs SeqWare & CWL) https://github.com/Consonance/consonance/wiki
* Dog https://github.com/dogtools/dog
* Produce https://github.com/texttheater/produce
* LONI Pipeline http://pipeline.loni.usc.edu/
* Cpipe https://github.com/MelbourneGenomics/cpipe
* AWE https://github.com/MG-RAST/AWE
* (Py)COMPSs https://www.bsc.es/research-and-development/software-and-apps/software-list/comp-superscalar/
* KLIKO https://github.com/gijzelaerr/kliko
* SoS Workflow https://github.com/vatlab/SoS https://vatlab.github.io/sos-docs/ https://doi.org/10.1093/bioinformatics/bty405  https://doi.org/10.1371/journal.pcbi.1006843
* XNAT Pipeline Engine https://wiki.xnat.org/display/XNAT/Pipeline+Engine https://wiki.xnat.org/display/XNAT/XNAT+Pipeline+Development+Schema
* Metapipe https://github.com/TorkamaniLab/metapipe
* OCCAM (Open Curation for Computer Architecture Modeling) https://occam.cs.pitt.edu/
* Copernicus http://www.copernicus-computing.org
* VisTrails https://www.vistrails.org
* Dagman A meta-scheduler for HTCondor https://research.cs.wisc.edu/htcondor/dagman/dagman.html
* UNICORE https://www.unicore.eu/docstore/workflow-7.6.0/workflow-manual.html#wf_dialect
* Toil (A scalable, efficient, cross-platform and easy-to-use workflow engine in pure Python) https://github.com/BD2KGenomics/toil
* Civet https://github.com/TheJacksonLaboratory/civet
* Cumulus https://github.com/Kitware/cumulus
* High-performance integrated virtual environment (HIVE) https://hive.biochemistry.gwu.edu
* Cloudgene http://cloudgene.uibk.ac.at/cloudgene-yaml
* FASTR https://bitbucket.org/bigr_erasmusmc/fastr/ http://fastr.readthedocs.io/en/stable/
* BioMake https://github.com/evoldoers/biomake https://doi.org/10.1101/093245
* remake https://github.com/richfitz/remake
* SciFloware http://www-sop.inria.fr/members/Didier.Parigot/pmwiki/Scifloware/
* OpenAlea http://openalea.gforge.inria.fr/dokuwiki/doku.php https://hal.archives-ouvertes.fr/hal-01166298/file/openalea-PradalCohen-Boulakia.pdf
* COMBUSTI/O https://github.com/jarlebass/combustio http://hdl.handle.net/10037/9361
* BioCloud https://github.com/ccwang002/biocloud-server-kai https://doi.org/10.6342/NTU201601295
* |ss| Triana http://www.trianacode.org/ |se| (website seems to have been taken over by SEO)
* Anduril http://anduril.org/site/
* dgsh http://www.dmst.aueb.gr/dds/sw/dgsh/
* EDGE bioinformatics: Empowering the Development of Genomics Expertise https://bioedge.lanl.gov/edge_ui/ http://edge.readthedocs.io/ https://lanl-bioinformatics.github.io/EDGE/
* Pachyderm http://pachyderm.io/ http://pachyderm.readthedocs.io/en/stable/advanced/advanced.html
* Digdag https://www.digdag.io/
* Agua / Automated Genomics Utilities Agent http://aguadev.org
* BioDepot Workflow Builder (BwB) https://github.com/BioDepot/BioDepot-workflow-builder https://doi.org/10.1101/099010
* IMP: a pipeline for reproducible reference-independent integrated metagenomic and metatranscriptomic analyses http://r3lab.uni.lu/web/imp/ https://doi.org/10.1186/s13059-016-1116-8
* Butler https://github.com/llevar/butler
* adage / yadage https://github.com/diana-hep/adage https://github.com/diana-hep/yadage
* HI-WAY: Execution of Scientific Workflows on Hadoop YARN https://github.com/marcbux/Hi-WAY https://openproceedings.org/2017/conf/edbt/paper-248.pdf
* OpenMOLE https://github.com/openmole/openmole https://www.openmole.org/ https://doi.org/10.3389/fninf.2017.00021
* Biopet https://github.com/biopet/biopet
* Nephele https://nephele.niaid.nih.gov/
* TOPPAS https://doi.org/10.1021/pr300187f
* SBpipe https://pdp10.github.io/sbpipe/ https://github.com/pdp10/sbpipe https://doi.org/10.1186/s12918-017-0423-3
* Dray http://dray.it/
* GenomeVIP https://github.com/ding-lab/GenomeVIP https://doi.org/10.1101/gr.211656.116
* GridSAM https://sourceforge.net/projects/gridsam/
* Roddy https://github.com/eilslabs/Roddy
* SciFlo (historical; doesn't seem to be maintained anymore) https://web.archive.org/web/20161118011409/https://sciflo.jpl.nasa.gov/SciFloWiki/FrontPage
* GNU Guix Workflow Language https://git.roelj.com/guix/gwl.git#gnu-guix-workflow-language-extension https://github.com/UMCUGenetics/guix-workflows/blob/master/umcu/workflows/rnaseq.scm
* Porcupine https://timvanmourik.github.io/Porcupine/
* ECFLOW (Workflow primarily for Meteorological Applications) https://software.ecmwf.int/wiki/display/ECFLOW/ecflow+home
* Ophidia http://ophidia.cmcc.it/
* WebLicht https://weblicht.sfs.uni-tuebingen.de/
* GATE Cloud https://cloud.gate.ac.uk/
* SCIPION http://scipion.cnb.csic.es/m/home/ https://github.com/I2PC/scipion/wiki/Creating-a-Protocol
* Ergatis http://ergatis.sourceforge.net/
* TIGR "Workflow" https://sourceforge.net/projects/tigr-workflow/ http://tigr-workflow.sourceforge.net/
* Archivematica https://wiki.archivematica.org/Main_Page (A preservation workflow system that implements the [[ISO-OAIS|https://en.wikipedia.org/wiki/Open_Archival_Information_System]] standard using gearman/MCP)
* Martian http://martian-lang.org/about/
* BioMAJ http://genouest.github.io/biomaj/
* Conveyor http://conveyor.cebitec.uni-bielefeld.de (retired). https://academic.oup.com/bioinformatics/article/27/7/903/230562/Conveyor-a-workflow-engine-for-bioinformatic
* Biopipe http://www.biopipe.org (appears to be defunct) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC403782/
* Wildfire http://wildfire.bii.a-star.edu.sg/ https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-6-69
* BioWBI http://bioinformatics.hsanmartino.it/bits_library/library/00079.pdf
* BioWMS http://bioinformatics.hsanmartino.it/bits_library/library/00568.pdf
* BioMoby http://biomoby.open-bio.org/ https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-7-523
* SIBIOS http://ieeexplore.ieee.org/document/1309094/
* NGSANE https://github.com/BauerLab/ngsane https://academic.oup.com/bioinformatics/article/30/10/1471/266879/NGSANE-a-lightweight-production-informatics
* Pwrake https://github.com/misshie/Workflows https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3180464/
* Nesoni https://github.com/Victorian-Bioinformatics-Consortium/nesoni
* Skam http://skam.sourceforge.net/skam-intro.html
* TREVA http://bioinformatics.petermac.org/treva/ http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0095217
* EGene https://www.semanticscholar.org/paper/EGene-a-configurable-pipeline-generation-system-fo-Durham-Kashiwabara/4c0656195b5efcdd3aa7bdcb55fc95a957c150aa https://academic.oup.com/bioinformatics/article/30/18/2659/2475637/EuGene-PP-a-next-generation-automated-annotation
* WEP https://bioinformatics.cineca.it/wep/ https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-14-S7-S11
* Microbase http://www.microbasecloud.com/
* e-Science Central http://www.esciencecentral.co.uk/ https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3538293/
* Cyrille2 https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-9-96
* PaPy https://code.google.com/archive/p/papy/ https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3051902/
* JobCenter https://github.com/yeastrc/jobcenter https://scfbm.biomedcentral.com/articles/10.1186/1751-0473-7-8
* CoreFlow https://www.ncbi.nlm.nih.gov/pubmed/24503186
* dynamic-pipeline https://code.google.com/archive/p/dynamic-pipeline/
* XiP http://xip.hgc.jp/wiki/en/Main_Page https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3530915/
* Eoulsan http://www.outils.genomique.biologie.ens.fr/eoulsan/ https://www.ncbi.nlm.nih.gov/pubmed/22492314
* CloudDOE http://clouddoe.iis.sinica.edu.tw/
* BioPig https://github.com/JGI-Bioinformatics/biopig https://www.ncbi.nlm.nih.gov/pubmed/24021384
* SeqPig https://github.com/HadoopGenomics/SeqPig https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3866557/
* zymake http://www-personal.umich.edu/~ebreck/code/zymake/
* JMS https://github.com/RUBi-ZA/JMS http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0134273
* CLC Genomics Workbench https://www.qiagenbioinformatics.com/products/clc-genomics-workbench/
* NG6 http://ng6.toulouse.inra.fr/ https://www.ncbi.nlm.nih.gov/pubmed/22958229
* VIBE http://www.incogen.com/vibe/
* WDL (Workflow Description Language) https://github.com/broadinstitute/wdl
* SciFlow https://github.com/kaizhang/SciFlow (not to be confused with SciFloware and SciFlo).
* Bioshake https://github.com/PapenfussLab/bioshake
* SciPipe http://scipipe.org
* Kapacitor / TICKscripts https://docs.influxdata.com/kapacitor/v1.3//tick/
* AiiDA: Automated Interactive Infrastructure and Database for Computational Science http://www.aiida.net/ https://doi.org/10.1016/j.commatsci.2015.09.013
* Reflow: a language and runtime for distributed, integrated data processing in the cloud https://github.com/grailbio/reflow
* Resolwe: an open source dataflow package for Django framework https://github.com/genialis/resolwe
* Yahoo! Pipes (historical) https://en.wikipedia.org/wiki/Yahoo!_Pipes
* Walrus https://github.com/fjukstad/walrus
* Apache Beam https://beam.apache.org/
* CLOSHA https://closha.kobic.re.kr/ https://www.bioexpress.re.kr/go_tutorial http://docplayer.net/19700397-Closha-manual-ver1-1-kobic-korean-bioinformation-center-kogun82-kribb-re-kr-2016-05-08-bioinformatics-workflow-management-system-in-bio-express.html https://doi.org/10.1186/s12859-018-2019-3
* WopMars https://github.com/aitgon/wopmars http://wopmars.readthedocs.io/
* flowing-clj https://github.com/stain/flowing-clj
* Plumbing and Graph https://github.com/plumatic/plumbing
* LabView http://www.ni.com/en-us/shop/labview.html
* MyOpenLab http://myopenlab.org/
* Max/MSP https://cycling74.com/products/max/
* NoFlo https://noflojs.org/
* Flowstone http://www.dsprobotics.com/flowstone.html
* HyperLoom https://code.it4i.cz/ADAS/loom https://code.it4i.cz/ADAS/loom
* Dask http://dask.pydata.org/en/latest/ https://github.com/dask/dask
* Stimela https://github.com/SpheMakh/Stimela https://github.com/SpheMakh/Stimela/wiki https://www.acru.ukzn.ac.za/~cosmosafari2017/wp-content/uploads/2017/02/makhathini.pdf
* JTracker https://jtracker.io/ https://github.com/jtracker-io
* PipelineDog http://pipeline.dog/ https://github.com/zhouanbo/pipelinedog https://doi.org/10.1093/bioinformatics/btx759
* DALiuGE https://arxiv.org/abs/1702.07617 https://github.com/ICRAR/daliuge https://daliuge.readthedocs.io/
* Overseer https://github.com/framed-data/overseer
* Squonk https://squonk.it/
* GC3Pie https://github.com/uzh/gc3pie
* Fractalide https://github.com/fractalide/fractalide
* TOGGLe http://toggle.southgreen.fr/ https://doi.org/10.1101/245480
* Askalon http://www.askalon.org
* Eclipse ICE (The Integrated Computational Environment) https://www.eclipse.org/ice
* Sandia Analysis Workbench (SAW) http://www.sandia.gov/saw/
* dispel4py https://github.com/dispel4py/dispel4py
* Jobber https://pypi.python.org/pypi/Jobber/0.1.4
* NeatSeq-Flow http://neatseq-flow.readthedocs.io/
* S4M https://bitbucket.org/uqokorn/s4m_base/wiki/Home
* Loom http://med.stanford.edu/gbsc/loom.html https://github.com/StanfordBioinformatics/loom http://loom.readthedocs.io/en/latest/templates.html
* Watchdog - XML Schema-based bioinformatics workflow system https://www.bio.ifi.lmu.de/software/watchdog/ https://doi.org/10.1186/s12859-018-2107-4  https://github.com/klugem/watchdog 
* phpflo https://github.com/phpflo/phpflo
* BASTet: Berkeley Analysis and Storage Toolkit https://openmsi.nersc.gov/openmsi/client/bastet.html https://biorack.github.io/BASTet/ https://doi.org/10.1109/TVCG.2017.2744479
* Tavaxy: Pattern based workflow system for the bioinformatics domain http://www.tavaxy.org/
* Ginflow: Decentralised adaptive workflow engine https://ginflow.inria.fr/
* SciApps: A cloud-based platform for reproducible bioinformatics workflows https://doi.org/10.1093/bioinformatics/bty439 https://www.sciapps.org/
* Stoa: Script Tracking for Observational Astronomy https://github.com/petehague/Stoa
* Collective Knowledge (CK) framework http://cknowledge.org/
* QosCosGrid (QCG) http://www.qoscosgrid.org/ http://www.qoscosgrid.org/trac/qcg-broker/wiki/qcg-advanced-client%20
* High-Throughput Binding Affinity Calculator (HTBAC) https://htbac.readthedocs.io/en/latest/ https://github.com/radical-cybertools/htbac https://arxiv.org/abs/1801.01174 
* BioWorkbench (Swift-based) https://arxiv.org/abs/1801.03915 https://github.com/mmondelli/bioworkbench
* ENVI Task Engine https://gbdxdocs.digitalglobe.com/docs/envi-task-engine https://www.harrisgeospatial.com/Learn/Whitepapers/TabId/2359/ArtMID/10212/ArticleID/17299/Workflow-Tools-in-ENVI.aspx https://envi-py-engine.readthedocs.io/en/latest/index.html
* Pypeline https://github.com/cgarciae/pypeln
* mpipe http://vmlaker.github.io/mpipe/
* idseq-dag https://github.com/chanzuckerberg/idseq-dag
* Piper (based upon GATK Queue) https://github.com/NationalGenomicsInfrastructure/piper
* Apache Object Oriented Data Technology (OODT) http://oodt.apache.org/
* JX Workflow (DSL for Makeflow) https://ccl.cse.nd.edu/software/manuals/jx-quick.html http://ccl.cse.nd.edu/research/papers/jx-escience-2018.pdf
* The Adaptable IO System (ADIOS), ADIOS using applications can be the orchestrated into a workflow http://csmd.ornl.gov/adios
* GenPipes  https://bitbucket.org/mugqic/genpipes https://doi.org/10.1101/459552
* Argo https://argoproj.github.io/ https://github.com/argoproj/argo https://github.com/argoproj/argo/blob/master/examples/README.md
* Reana https://reana.readthedocs.io/en/latest/ https://github.com/reanahub/reana
* Cuisine Framework https://www.astron.nl/~renting/cuisine.html
* Niassa https://github.com/oicr-gsi/niassa https://oicr-gsi.github.io/niassa-docs/
* pypeFLOW https://github.com/PacificBiosciences/pypeFLOW
* Tiny Cloud Engine http://ka.cb.k.u-tokyo.ac.jp/tce/
* Xbowflow https://github.com/ChrisSuess/Project-Xbow/tree/master/xbowflow
* AdaptiveMd https://github.com/markovmodel/adaptivemd
* Meshroom https://github.com/alicevision/meshroom
* LSST Data Management https://github.com/lsst/pipe_base
* CGAT-core https://github.com/cgat-developers/cgat-core
* Prefect https://docs.prefect.io/
* Apache SCXML engine https://commons.apache.org/proper/commons-scxml/guide/core-engine.html https://commons.apache.org/proper/commons-scxml/guide/scxml-documents.html
* IceProd https://github.com/WIPACrepo/iceprod
* AnADAMA2 http://huttenhower.sph.harvard.edu/anadama2
* Luna https://luna-lang.org/
* Passerelle https://code.google.com/archive/a/eclipselabs.org/p/passerelle
* Kurator-Akka https://github.com/kurator-org/kurator-akka
* Jug https://doi.org/10.5334/jors.161
* Node-RED https://nodered.org/
* Databolt Flow https://github.com/d6t/d6tflow
* Frictionless Data Package Pipelines https://github.com/frictionlessdata/datapackage-pipelines
* DataFlows https://github.com/datahq/dataflows
* Volcano https://github.com/volcano-sh/volcano
* DataJoint https://datajoint.io/
* DIRAC3 (LHCb grid software) https://doi.org/10.1088/1742-6596/219/6/062029
* Orange https://orange.biolab.si/ http://jmlr.org/papers/v14/demsar13a.html
* Ensemble Toolkit (EnTK) https://radicalentk.readthedocs.io/en/latest/entk.html https://arxiv.org/abs/1602.00678v2
* BioQueue http://www.bioqueue.org/ https://github.com/liyao001/BioQueue https://doi.org/10.1093/bioinformatics/btx403
* mlr3pipelines https://mlr3pipelines.mlr-org.com/
* Kedro - Production-Ready Data & ML Pipelines https://github.com/quantumblacklabs/kedro
* DATAVIEW - DATAVIEW is a big data workflow management system. https://github.com/shiyonglu/DATAVIEW
* SecDATAVIEW - SecDATAVIEW is a security oriented big data workflow management system compatible with the heterogeneous computing environments. https://github.com/shiyonglu/SecDATAVIEW
* Giraffe Tools https://giraffe.tools/
* CERAMICCA - Cloud Engine Resource for Accelerated Medical Image Computing for Clinical Applications: https://ceramicca.ensc.sfu.ca 
* uap - Universal Analysis Pipeline. A workflow management system dedicated to robust, consistent, and reproducible HTS data analysis. https://github.com/yigbt/uap
* signac https://signac.io/
* cwltool - reference implementation of Common Workflow Language (CWL) https://github.com/common-workflow-language/cwltool/
* CWLEXEC - CWL executor for IBM Spectrum LSF clusters https://github.com/IBMSpectrumComputing/cwlexec
* drmr https://github.com/ParkerLab/drmr/ https://drmr.readthedocs.io/
* Autosubmit - a versatile tool to manage Weather and Climate Experiments in diverse Supercomputing Environments. https://www.bsc.es/research-and-development/software-and-apps/software-list/autosubmit https://autosubmit.readthedocs.io/en/latest/
* JUDI https://doi.org/10.1093/bioinformatics/btz956 https://github.com/ncbi/JUDI
* Sumatra - a tool for managing and tracking projects based on numerical simulation or analysis, with the aim of supporting reproducible research https://neuralensemble.org/sumatra/
* Netflix Conductor: https://netflix.github.io/conductor/
* Pipengine https://doi.org/10.21105/joss.00341 https://github.com/fstrozzi/bioruby-pipengine
* MyQueue https://doi.org/10.21105/joss.01844 https://gitlab.com/myqueue/myqueue
* Drake R package https://doi.org/10.21105/joss.00550 https://github.com/ropensci/drake
* MaDaTS https://10.21105/joss.00830 https://github.com/dghoshal-lbl/madats

