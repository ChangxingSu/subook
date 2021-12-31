%%%%%%%%%%%%%%%%%%%%%%
%% start of file `subook.cls'.
%% Copyright 2013-2021 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/chancey922/subook
% 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{subook}[2021/12/27 Super Un LaTeX book class]
\gdef\@fpheader{\ }
\gdef\@journal{jhep}

\newif\ifnotoc\notocfalse
\newif\ifemailadd\emailaddfalse
\newif\iftoccontinuous\toccontinuousfalse
\newif\ifnatbibsort\natbibsorttrue
\LoadClass{article}
\DeclareOption{no-natbib-sort}{\natbibsortfalse}
\ProcessOptions\relax
% ----------------------------------------------------------------------
%           User Top Level Packages: Required
% ----------------------------------------------------------------------
% % \RequirePackage{xcolor}                                  % Color Setting
% \RequirePackage{kvoptions}                               % 传递参数
% % \RequirePackage{etoolbox}                                % 传递命令
% \usepackage{marginnote}
% \usepackage{sidenotes}
% \usepackage{fancyhdr}
% \usepackage{titlesec}
% \usepackage[many]{tcolorbox}
% \usepackage[dvipsnames]{xcolor}
% \RequirePackage{geometry}                                % 自定义页面
% \RequirePackage{iftex}                                   % 判断编译器版本



\usepackage{marginnote,sidenotes,fancyhdr,titlesec,geometry}
\usepackage[dvipsnames]{xcolor}
\usepackage[many]{tcolorbox}

% ----------------------------------------------------------------------
%           User Top Level Packages: Additional & Styling
% ----------------------------------------------------------------------

% \RequirePackage[T1]{fontenc}                            % Font Styling
% \RequirePackage{lmodern,mathrsfs}
% \RequirePackage{hyperref}
% \RequirePackage{csquotes}
% \RequirePackage{setspace}
% \RequirePackage[shortlabels]{enumitem}

% \RequirePackage{mathtools,amssymb,amsfonts,amsthm,bm}   % Math Presets
% \RequirePackage{array,tabularx,booktabs}                % Table Presets
% \RequirePackage{graphicx,wrapfig,float,caption}         % Figure Presets
% \RequirePackage{setspace,multicol}                      % Text Presets
% \RequirePackage{tikz,physics,cancel}                    % Physics Presets
\usepackage[T1]{fontenc}                            % Font Styling
\usepackage{lmodern,mathrsfs}

\usepackage[shortlabels]{enumitem}

\usepackage{mathtools,amssymb,amsfonts,amsthm,bm}   % Math Presets
\usepackage{array,tabularx,booktabs}                % Table Presets
\usepackage{graphicx,wrapfig,float,caption}         % Figure Presets
\usepackage{setspace,multicol}                      % Text Presets
\usepackage{tikz,physics,cancel}                    % Physics Presets

% ----------------------------------------------------------------------
%           User Language Prefrences 
% ----------------------------------------------------------------------


% ----------------------------------------------------------------------
%           User Page Prefrences 
% ----------------------------------------------------------------------
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

%% paper layout with left and right margin
\geometry{paperheight=11in,paperwidth=8.5in,                   %fix paperwidth and height.
    marginparsep=.02\paperwidth,marginparwidth=.2\paperwidth,
    inner=.11\paperwidth,voffset=-1in,headheight=.02\paperheight,
    headsep=.03\paperheight,footskip=20pt,
    textheight=.795\paperheight,textwidth=.62\paperwidth}
    
%%% new page style
\pagestyle{fancy}%
\newlength{\myoddoffset}%
\setlength{\myoddoffset}{\marginparwidth + \marginparsep}%
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}%
\renewcommand{\subsectionmark}[1]{\markright{#1}{}}%
    
%%% new page style
\fancypagestyle{fancynotes}{%
    \fancyhf{}%
    \fancyheadoffset[rh]{\myoddoffset}%
    \renewcommand{\headrulewidth}{0pt}%
    \fancyhead[L]{\textsc{\leftmark}}%
    \fancyhead[R]{\footnotesize \textit{\rightmark}~~~~ \thepage}%
    }%
    
%%% new page style
\fancypagestyle{fancypart}{%
    \fancyhf{}%
    \fancyfootoffset[rh]{\myoddoffset}%
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[L]{\footnotesize \thepage}%
    }%
        
\titleformat{\part}[hang]{{\thispagestyle{fancypart}}\Huge\bfseries}{\marginnote{
\begin{tcolorbox}[width=\marginparwidth,height=\marginparwidth/2,colback=black!75!white,colframe=black!75!white,center title,fonttitle=\bfseries\normalsize,title=PART,text fill]
    \begin{center}
    {\color{white}\thepart}
    \end{center}
    \end{tcolorbox}
    }[-1.25in]}{0pt}{\sffamily\Huge\bfseries}

% use minipage to create a new enviorment          
\newenvironment{fullpage}
    {\smallskip\noindent\begin{minipage}
    {\textwidth+\marginparwidth+\marginparsep}\hrule\smallskip\smallskip}
    {\hrule\end{minipage}\vspace{.1in}}


% Page layout
\renewcommand{\baselinestretch}{1.0}\normalsize
\setlength\lineskip{1\p@}
\setlength\parindent{1.2\parindent}
\setlength\normallineskip{1\p@}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\widowpenalty 1000
\clubpenalty 1000

% the depth of toc
\setcounter{topnumber}{4}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.6}
\setcounter{totalnumber}{5}
\renewcommand\textfraction{0}
\renewcommand\floatpagefraction{1}
\addtolength\textheight{\topskip}

\marginparpush 6\p@
\topmargin   .05\paperheight

\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
% reset section
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                {-3.5ex \@plus -1.3ex \@minus -.7ex}%
                                {2.3ex \@plus.4ex \@minus .4ex}%
                                {\normalfont\large\bfseries}}
%headings style


\newcommand\psection{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1.3ex \@minus -.7ex}%
                                   {2.3ex \@plus .4ex \@minus .4ex}%
                                   {\ }}

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1.3ex \@minus -.7ex}%
                                   {2.3ex \@plus .4ex \@minus .4ex}%
                                   {\sffamily\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-2.3ex \@plus -1ex \@minus -.5ex}%
                                   {1.2ex \@plus .3ex \@minus .3ex}%
                                   {\sffamily\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-2.3ex \@plus -1ex \@minus -.5ex}%
                                   {1.0ex \@plus .2ex \@minus .2ex}%
                                   {\sffamily\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                   {1.75ex \@plus1ex \@minus.2ex}%
                                   {-1em}%
                                   {\sffamily\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                   {1.75ex \@plus1ex \@minus .2ex}%
                                   {-1em}%
                                   {\sffamily\normalsize\bfseries}}


%Caption of figure and table
\def\fnum@figure{\textbf{\figurename\nobreakspace\thefigure}}
\def\fnum@table{\textbf{\tablename\nobreakspace\thetable}}
% ----------------------------------------------------------------------
%           User Created Environments 
% ----------------------------------------------------------------------



\newtheoremstyle{mystyle}%
  {}%
  {}%
  {}%
  {}%
  {\sffamily\bfseries}%
  {.}%
  { }%
  {}%

\renewenvironment{proof}{{\sffamily\bfseries Proof. }}{\qed}

\theoremstyle{mystyle}{
  \newtheorem*{remark}{Remark}
}

\theoremstyle{mystyle}{
  \newtheorem{definition}{Definition}[section]
}

\theoremstyle{mystyle}{
  \newtheorem{theorem}{Theorem}[section]
}

\theoremstyle{mystyle}{
  \newtheorem{lemma}[theorem]{Lemma}
}

\theoremstyle{mystyle}{
  \newtheorem*{example}{Example}
}

\theoremstyle{definition}{
    \newtheorem*{exercise}{Exercise}}


\tcolorboxenvironment{definition}{
  boxrule=0pt,
  boxsep=2pt,
  colback={White!90!Cerulean},
  enhanced jigsaw, 
  borderline west={2pt}{0pt}{Cerulean},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  breakable,
}

\tcolorboxenvironment{theorem}{
  boxrule=0pt,
  boxsep=2pt,
  colback={White!90!Dandelion},
  enhanced jigsaw, 
  borderline west={2pt}{0pt}{Dandelion},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  breakable,
}

\tcolorboxenvironment{lemma}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{0pt}{Red},
  before skip=10pt,
  after skip=10pt,
  sharp corners,
  left=12pt,
  right=12pt,
  breakable,
}

\tcolorboxenvironment{proof}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{0pt}{NavyBlue!80!white},
  before skip=10pt,
  after skip=10pt,
  left=12pt,
  right=12pt,
  breakable,
}

\tcolorboxenvironment{remark}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{0pt}{Green},
  before skip=10pt,
  after skip=10pt,
  left=12pt,
  right=12pt,
  breakable,
}

\tcolorboxenvironment{example}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{0pt}{Black},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=12pt,
  right=12pt,
  breakable,
}


\renewcommand*{\raggedleftmarginnote}{\noindent}
\renewcommand*{\raggedrightmarginnote}{\noindent}
\newcommand{\mn}[1]{\textsuperscript{\thesidenote}{}\marginnote{\textsuperscript{\thesidenote}{}\itshape\footnotesize #1}\refstepcounter{sidenote}}
\newcommand{\en}[1]{\marginnote{\footnotesize{#1}}}
\newcommand{\lec}[2]{{\setlength{\marginparwidth}{.07\paperwidth}\reversemarginpar\marginnote{\centering\footnotesize{\textsf{\bfseries #1}}\\#2}}}
\newcommand{\sn}[1]{\sidenote{\itshape\footnotesize #1}}


% ----------------------------------------------------------------------
%           User Created Commands
% ----------------------------------------------------------------------

\newcommand*\widefbox[1]{\fbox{\hspace{2em}#1\hspace{2em}}}
\newcommand{\xint}{\int_{x_1}^{x_2}}
\newcommand{\tint}{\int_{t_1}^{t_2}}
\newcommand{\mw}{\sqrt{m\omega}}
\newcommand{\de}{\delta}
\newcommand{\dde}{\dot{\delta}}
\newcommand{\di}{\delta_i}
\newcommand{\ddi}{\dot{\delta_i}}
\newcommand{\dddi}{\ddot{\delta_i}}
\newcommand{\dipl}{\delta_{i+1}}
\newcommand{\dimi}{\delta_{i-1}}
\newcommand{\ddt}[1]{\frac{{d} #1}{dt}}
\newcommand{\ddtt}[1]{\frac{d^2 #1}{dt^2}}
\newcommand{\ddx}[1]{\frac{d #1}{dx}}
\newcommand{\ddxx}[1]{\frac{d^2 #1}{dx^2}}
\newcommand{\eps}{\epsilon}
\newcommand{\del}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\deltwo}[2]{\frac{\partial^2 #1}{\partial #2^2}}
\newcommand{\lam}{\lambda}
\newcommand{\Lam}{\Lambda}
\newcommand{\sig}{\sigma}
\newcommand{\Sig}{\Sigma}
\newcommand{\half}{\frac{1}{2}}
\newcommand{\munu}{{\mu\nu}}
\newcommand{\thalf}{\tfrac{1}{2}}

\newcommand{\bfA}{{\bf A}}
\newcommand{\bfB}{{\bf B}}
\newcommand{\bfC}{{\bf C}}
\newcommand{\bfD}{{\bf D}}
\newcommand{\bfE}{{\bf E}}
\newcommand{\bfF}{{\bf F}}
\newcommand{\bfG}{{\bf G}}
\newcommand{\bfH}{{\bf H}}
\newcommand{\bfI}{{\bf I}}
\newcommand{\bfJ}{{\bf J}}
\newcommand{\bfK}{{\bf K}}
\newcommand{\bfL}{{\bf L}}
\newcommand{\bfM}{{\bf M}}
\newcommand{\bfN}{{\bf N}}
\newcommand{\bfO}{{\bf O}}
\newcommand{\bfP}{{\bf P}}
\newcommand{\bfQ}{{\bf Q}}
\newcommand{\bfR}{{\bf R}}
\newcommand{\bfS}{{\bf S}}
\newcommand{\bfT}{{\bf T}}
\newcommand{\bfU}{{\bf U}}
\newcommand{\bfV}{{\bf V}}
\newcommand{\bfW}{{\bf W}}
\newcommand{\bfX}{{\bf X}}
\newcommand{\bfY}{{\bf Y}}
\newcommand{\bfZ}{{\bf Z}}

\newcommand{\bfa}{{\bf a}}
\newcommand{\bfb}{{\bf b}}
\newcommand{\bfc}{{\bf c}}
\newcommand{\bfd}{{\bf d}}
\newcommand{\bfe}{{\bf e}}
\newcommand{\bff}{{\bf f}}
\newcommand{\bfg}{{\bf g}}
\newcommand{\bfh}{{\bf h}}
\newcommand{\bfi}{{\bf i}}
\newcommand{\bfj}{{\bf j}}
\newcommand{\bfk}{{\bf k}}
\newcommand{\bfl}{{\bf l}}
\newcommand{\bfm}{{\bf m}}
\newcommand{\bfn}{{\bf n}}
\newcommand{\bfo}{{\bf o}}
\newcommand{\bfp}{{\bf p}}
\newcommand{\bfq}{{\bf q}}
\newcommand{\bfr}{{\bf r}}
\newcommand{\bfs}{{\bf s}}
\newcommand{\bft}{{\bf t}}
\newcommand{\bfu}{{\bf u}}
\newcommand{\bfv}{{\bf v}}
\newcommand{\bfw}{{\bf w}}
\newcommand{\bfx}{{\bf x}}
\newcommand{\bfy}{{\bf y}}
\newcommand{\bfz}{{\bf z}}

\newcommand{\mcA}{{\mathcal{A}}}
\newcommand{\mcB}{{\mathcal{B}}}
\newcommand{\mcC}{{\mathcal{C}}}
\newcommand{\mcD}{{\mathcal{D}}}
\newcommand{\mcE}{{\mathcal{E}}}
\newcommand{\mcF}{{\mathcal{F}}}
\newcommand{\mcG}{{\mathcal{G}}}
\newcommand{\mcH}{{\mathcal{H}}}
\newcommand{\mcI}{{\mathcal{I}}}
\newcommand{\mcJ}{{\mathcal{J}}}
\newcommand{\mcK}{{\mathcal{K}}}
\newcommand{\mcL}{{\mathcal{L}}}
\newcommand{\mcM}{{\mathcal{M}}}
\newcommand{\mcN}{{\mathcal{N}}}
\newcommand{\mcO}{{\mathcal{O}}}
\newcommand{\mcP}{{\mathcal{P}}}
\newcommand{\mcQ}{{\mathcal{Q}}}
\newcommand{\mcR}{{\mathcal{R}}}
\newcommand{\mcS}{{\mathcal{S}}}
\newcommand{\mcT}{{\mathcal{T}}}
\newcommand{\mcU}{{\mathcal{U}}}
\newcommand{\mcV}{{\mathcal{V}}}
\newcommand{\mcW}{{\mathcal{W}}}
\newcommand{\mcX}{{\mathcal{X}}}
\newcommand{\mcY}{{\mathcal{Y}}}
\newcommand{\mcZ}{{\mathcal{Z}}}

\newcommand{\bbA}{{\mathbb{A}}}
\newcommand{\bbB}{{\mathbb{B}}}
\newcommand{\bbC}{{\mathbb{C}}}
\newcommand{\bbD}{{\mathbb{D}}}
\newcommand{\bbE}{{\mathbb{E}}}
\newcommand{\bbF}{{\mathbb{F}}}
\newcommand{\bbG}{{\mathbb{G}}}
\newcommand{\bbH}{{\mathbb{H}}}
\newcommand{\bbI}{{\mathbb{I}}}
\newcommand{\bbJ}{{\mathbb{J}}}
\newcommand{\bbK}{{\mathbb{K}}}
\newcommand{\bbL}{{\mathbb{L}}}
\newcommand{\bbM}{{\mathbb{M}}}
\newcommand{\bbN}{{\mathbb{N}}}
\newcommand{\bbO}{{\mathbb{O}}}
\newcommand{\bbP}{{\mathbb{P}}}
\newcommand{\bbQ}{{\mathbb{Q}}}
\newcommand{\bbR}{{\mathbb{R}}}
\newcommand{\bbS}{{\mathbb{S}}}
\newcommand{\bbT}{{\mathbb{T}}}
\newcommand{\bbU}{{\mathbb{U}}}
\newcommand{\bbV}{{\mathbb{V}}}
\newcommand{\bbW}{{\mathbb{W}}}
\newcommand{\bbX}{{\mathbb{X}}}
\newcommand{\bbY}{{\mathbb{Y}}}
\newcommand{\bbZ}{{\mathbb{Z}}}

\newcommand{\mfa}{{\mathfrak{a}}}
\newcommand{\mfb}{{\mathfrak{b}}}
\newcommand{\mfc}{{\mathfrak{c}}}
\newcommand{\mfd}{{\mathfrak{d}}}
\newcommand{\mfe}{{\mathfrak{e}}}
\newcommand{\mff}{{\mathfrak{f}}}
\newcommand{\mfg}{{\mathfrak{g}}}
\newcommand{\mfh}{{\mathfrak{h}}}
\newcommand{\mfi}{{\mathfrak{i}}}
\newcommand{\mfj}{{\mathfrak{j}}}
\newcommand{\mfk}{{\mathfrak{k}}}
\newcommand{\mfl}{{\mathfrak{l}}}
\newcommand{\mfm}{{\mathfrak{m}}}
\newcommand{\mfn}{{\mathfrak{n}}}
\newcommand{\mfo}{{\mathfrak{o}}}
\newcommand{\mfp}{{\mathfrak{p}}}
\newcommand{\mfq}{{\mathfrak{q}}}
\newcommand{\mfr}{{\mathfrak{r}}}
\newcommand{\mfs}{{\mathfrak{s}}}
\newcommand{\mft}{{\mathfrak{t}}}
\newcommand{\mfu}{{\mathfrak{u}}}
\newcommand{\mfv}{{\mathfrak{v}}}
\newcommand{\mfw}{{\mathfrak{w}}}
\newcommand{\mfx}{{\mathfrak{x}}}
\newcommand{\mfy}{{\mathfrak{y}}}
\newcommand{\mfz}{{\mathfrak{z}}}

\newcommand{\mfA}{{\mathfrak{A}}}
\newcommand{\mfB}{{\mathfrak{B}}}
\newcommand{\mfC}{{\mathfrak{C}}}
\newcommand{\mfD}{{\mathfrak{D}}}
\newcommand{\mfE}{{\mathfrak{E}}}
\newcommand{\mfF}{{\mathfrak{F}}}
\newcommand{\mfG}{{\mathfrak{G}}}
\newcommand{\mfH}{{\mathfrak{H}}}
\newcommand{\mfI}{{\mathfrak{I}}}
\newcommand{\mfJ}{{\mathfrak{J}}}
\newcommand{\mfK}{{\mathfrak{K}}}
\newcommand{\mfL}{{\mathfrak{L}}}
\newcommand{\mfM}{{\mathfrak{M}}}
\newcommand{\mfN}{{\mathfrak{N}}}
\newcommand{\mfO}{{\mathfrak{O}}}
\newcommand{\mfP}{{\mathfrak{P}}}
\newcommand{\mfQ}{{\mathfrak{Q}}}
\newcommand{\mfR}{{\mathfrak{R}}}
\newcommand{\mfS}{{\mathfrak{S}}}
\newcommand{\mfT}{{\mathfrak{T}}}
\newcommand{\mfU}{{\mathfrak{U}}}
\newcommand{\mfV}{{\mathfrak{V}}}
\newcommand{\mfW}{{\mathfrak{W}}}
\newcommand{\mfX}{{\mathfrak{X}}}
\newcommand{\mfY}{{\mathfrak{Y}}}
\newcommand{\mfZ}{{\mathfrak{Z}}}

%===========================================================================================================