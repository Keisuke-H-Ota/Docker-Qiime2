# Docker-Qiime2

* image の構築
* dockerfile で指定しているとおり、ここでは 2021 年 8 月版の qiime2 を install してみる。

```
$ docker build -t docker-qiime2 .
```

* コンテナを起動し、コンテナの中に入る

```
$ docker run -it -v $(pwd):/home docker-qiime2
```

* コンテナの中で ``/home`` ディレクトリに移動する
* ホスト側のカレントディレクトリとはコンテナ中の ``/home`` ディレクトリでマウントする。

```
# cd /home
```

* conda で構築した仮想環境を確認する。

```
# conda info --env
```

アスタリスクは現在いる仮想環境を表す。最初は ``base`` にいる。

```
base                  *  /opt/conda
qiime2-2021.8            /opt/conda/envs/qiime2-2021.8
```

コンテナ内で qiime2 仮想環境に入る

```
# conda activate qiime2-2021.8
```

* ``qiime`` と入力して次のヘルプが表示されたら成功している。

```
Usage: qiime [OPTIONS] COMMAND [ARGS]...

  QIIME 2 command-line interface (q2cli)
  --------------------------------------

  To get help with QIIME 2, visit https://qiime2.org.

  To enable tab completion in Bash, run the following command or add it to
  your .bashrc/.bash_profile:

      source tab-qiime

  To enable tab completion in ZSH, run the following commands or add them to
  your .zshrc:

      autoload -Uz compinit && compinit
      autoload bashcompinit && bashcompinit
      source tab-qiime

Options:
  --version   Show the version and exit.
  --help      Show this message and exit.

Commands:
  info                Display information about current deployment.
  tools               Tools for working with QIIME 2 files.
  dev                 Utilities for developers and advanced users.
  alignment           Plugin for generating and manipulating alignments.
  composition         Plugin for compositional data analysis.
  cutadapt            Plugin for removing adapter sequences, primers, and
                      other unwanted sequence from sequence data.

  dada2               Plugin for sequence quality control with DADA2.
  deblur              Plugin for sequence quality control with Deblur.
  demux               Plugin for demultiplexing & viewing sequence quality.
  diversity           Plugin for exploring community diversity.
  diversity-lib       Plugin for computing community diversity.
  emperor             Plugin for ordination plotting with Emperor.
  feature-classifier  Plugin for taxonomic classification.
  feature-table       Plugin for working with sample by feature tables.
  fragment-insertion  Plugin for extending phylogenies.
  gneiss              Plugin for building compositional models.
  longitudinal        Plugin for paired sample and time series analyses.
  metadata            Plugin for working with Metadata.
  phylogeny           Plugin for generating and manipulating phylogenies.
  quality-control     Plugin for quality control of feature and sequence data.
  quality-filter      Plugin for PHRED-based filtering and trimming.
  sample-classifier   Plugin for machine learning prediction of sample
                      metadata.

  taxa                Plugin for working with feature taxonomy annotations.
  vsearch             Plugin for clustering and dereplicating with vsearch.
```

* ``qiime tools view XXXXXXXXXX.qzv`` で viewer を起動させようとすると次のようなエラーが発生する。

```
Error: Visualization viewing is currently not supported in headless environments. You can view Visualizations (and Artifacts) at https://view.qiime2.org, or move the Visualization to an environment with a display and view it with `qiime tools view`.
```

``XXXXXXXXXX.qzv`` を可視化するには 
https://view.qiime2.org/ へアップデートするか、別の方法で viewer を構築する必要がある。


* conda で作った qiime2 仮想環境から抜ける

```
# exit
```
