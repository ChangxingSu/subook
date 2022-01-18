%% subook.sty
%% A package created for personal note 
%% by Changxing Su. 
%% ------------------------------- Legal -------------------------------
%% 
%% This work may be distributed and/or modified under the conditions of 
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version. The latest version of this 
%% license is in 
%%        http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%%
%% -------------------- Compiling this template  -----------------------
%% This template uses biber for its bibliography and makeindex for its index.
%% When you first open the template, compile it from the command line with the 
%% commands below to make sure your LaTeX distribution is configured correctly:
%% --------------------------------------------------------------------

% ----------------------------------------------------------------------
%                              Master Presets 
% ----------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{subook}[2021/12/27 SUper LaTeX book class]
\LoadClass[openany]{book}% here we use openany option to  remove a blank page that gets added automatically after \part{}

% ----------------------------------------------------------------------
%                   User Top Level Packages: Required
% ----------------------------------------------------------------------

\usepackage{marginnote, % Margin note
            % sidenotes,
            fancyhdr, % Header and footer 
            geometry, % Required for adjusting page dimensions and margins
            }
\usepackage[explicit]{titlesec} % Title setion
\usepackage{xcolor} % Get color
\usepackage[many]{tcolorbox} % Colorful Box
\usepackage{tikz} % Drawing Picture
\usetikzlibrary{calc}
\usepackage{siunitx} %  Use the siunitx package to format all numbers, currencies, units, etc:
\usepackage{makeidx} % Required to make an index
\makeindex % Tells LaTeX to create the files required for indexing

% ----------------------------------------------------------------------
%           User Top Level Packages: Additional & Styling
% ----------------------------------------------------------------------

\usepackage{epigraph,
            etoolbox
            }
\usepackage{lipsum} % Random words
\usepackage{minitoc} % Mini toc for each chapter
\usepackage{mathtools,amsthm,amssymb,amsfonts,bm}   % Math Presets
\usepackage{thmtools,amsmath}
\RequirePackage[
hidelinks,
backref=true,
pagebackref=true,
hyperindex=true,
colorlinks=false,
breaklinks=true,
urlcolor=ocre,
bookmarks=true,
bookmarksopen=false
                % urlcolor=Maroon,
                % anchorcolor=Maroon,
                citecolor=brown,
                ]{hyperref}
\usepackage{bookmark}
\bookmarksetup{
open,
numbered,
addtohook={%
\ifnum\bookmarkget{level}=0 % chapter
\bookmarksetup{bold}%
\fi
\ifnum\bookmarkget{level}=-1 % part
\bookmarksetup{color=ocre,bold}%
\fi
}
}
% \usepackage{natbib} % 引入natbib包，参考文献格式相关
% \usepackage{chapterbib}	% 引入chapterbib包，可以分章节显示参考文献，且参考文献编号各自独立
\usepackage{listings} % Quote
\usepackage{caption}

% ----------------------------------------------------------------------
%                            Defining Color
% ----------------------------------------------------------------------
\colorlet{sectcolor}{gray!65}
\definecolor{structurecolor}{RGB}{0,120,2}%
\definecolor{main}{RGB}{0,120,2}%
\definecolor{second}{RGB}{230,90,7}%
\definecolor{third}{RGB}{0,160,152}%
\definecolor{myblue}{RGB}{0,163,243}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}
% \definecolor{ocre}{RGB}{243,102,25} % Define the orange color used for highlighting throughout the book
\colorlet{ocre}{gray!65} 
\bibliographystyle{unsrtnat}% set cite font 
% \setcitestyle{authoryear,open={(},close={)}} %Citation-related commands

% ----------------------------------------------------------------------
%                                 Layout
% ----------------------------------------------------------------------
%% \usepackage{geometry}
\geometry{
        paper=a4paper,% Paper size
        top=2cm,% Top margin
        bottom=1.5cm, % Bottom margin
        right=6cm, %Right margin
        left=1.5cm,% Left margin        
        textheight=0.3cm,
        marginparwidth=5cm,
        marginparsep=0.5cm,
        asymmetric, % Make marginnote always right
        %showframe, % Uncomment to show how the type block is set on the page
}


\newenvironment{fullpage}
    {\smallskip\noindent\begin{minipage}
    {\textwidth+\marginparwidth+\marginparsep}\smallskip\smallskip}
    {\end{minipage}\vspace{.1in}}

%-----------------------------------------------------------------------
%	                                  Cover
%-----------------------------------------------------------------------
\newcommand\nbvspace[1][3]{\vspace*{\stretch{#1}}}
% allow some slack to avoid under/overfull boxes
\newcommand\nbstretchyspace{\spaceskip0.5em plus 0.25em minus 0.25em}
% To improve spacing on titlepages
\newcommand{\nbtitlestretch}{\spaceskip0.6em}

%-----------------------------------------------------------------------
%	                            TABLE OF CONTENTS
%-----------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	MAIN TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\contentsmargin{0cm} % Removes the default margin
%% Usage:
%% \titlecontents{⟨section⟩}
%%                  [⟨left⟩]
%%                  {⟨above⟩}
%%                  {⟨before with label⟩}
%%                  {⟨before without label⟩} 
%%                  {⟨filler and page⟩}
%%                  [⟨after⟩]

% Part text styling (this is mostly taken care of in the PART HEADINGS section of this file)
\titlecontents{part}
	[0cm] % Left indentation(whole)
	{\addvspace{20pt}\large\sffamily\bfseries} % Spacing and font options for parts
	{}
	{}
	{}


% Chapter text styling
\titlecontents{chapter}
	[1.25cm] % Left indentation
	{\addvspace{12pt}\large\sffamily\bfseries} % Spacing and font options for chapters
	{\color{ocre!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{ocre}} % Formatting of numbered sections of this type
	{\color{ocre}} % Formatting of numberless sections of this type
	{\color{ocre!60}\normalsize\;\titlerule*[.5pc]{.}\;\thecontentspage} % Formatting of the filler to the right of the heading and the page number

% Section text styling
\titlecontents{section}
	[1.25cm] % Left indentation
	{\addvspace{3pt}\sffamily\bfseries} % Spacing and font options for sections
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\hfill\color{black}\thecontentspage} % Formatting of the filler to the right of the heading and the page number

% Subsection text styling
\titlecontents{subsection}
	[1.25cm] % Left indentation
	{\addvspace{1pt}\sffamily\small} % Spacing and font options for subsections
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\ \titlerule*[.5pc]{.}\;\thecontentspage} % Formatting of the filler to the right of the heading and the page number

% Figure text styling
\titlecontents{figure}
	[1.25cm] % Left indentation
	{\addvspace{1pt}\sffamily\small} % Spacing and font options for figures
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\ \titlerule*[.5pc]{.}\;\thecontentspage} % Formatting of the filler to the right of the heading and the page number

% Table text styling
\titlecontents{table}
	[1.25cm] % Left indentation
	{\addvspace{1pt}\sffamily\small} % Spacing and font options for tables
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\ \titlerule*[.5pc]{.}\;\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%----------------------------------------------------------------------------------------
%	MINI TABLE OF CONTENTS IN PART HEADS
%----------------------------------------------------------------------------------------

% Chapter text styling
\titlecontents{lchapter}
	[0em] % Left indentation
	{\addvspace{15pt}\large\sffamily\bfseries} % Spacing and font options for chapters
	{\color{ocre}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{ocre}} % Chapter number
	{}  
	{\color{ocre}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number

% Section text styling
\titlecontents{lsection}
	[0em] % Left indentation
	{\sffamily\small} % Spacing and font options for sections
	{\contentslabel[\thecontentslabel]{1.25cm}} % Section number
	{}
	{}

% Subsection text styling (note these aren't shown by default, display them by searchings this file for tocdepth and reading the commented text)
\titlecontents{lsubsection}
	[.5em] % Left indentation
	{\sffamily\footnotesize} % Spacing and font options for subsections
	{\contentslabel[\thecontentslabel]{1.25cm}}
	{}
	{}

% \newcommand{\figureintoc}[1]{
%     \begin{figure}
%         \includegraphics{#1}%
%     \end{figure}
%     }
% Numbered part in the table of contents
\makeatletter
\newcommand{\@mypartnumtocformat}[2]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!20}{\strut\parbox[c][.7cm]{\ecart}{\color{ocre!70}\Large\sffamily\bfseries\centering#1}}\hskip\esp\colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth-\ecart-\esp}{\Large\sffamily\centering#2}}%
}

% Unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}%
}

\newlength\esp
\setlength\esp{4pt}
\newlength\ecart
\setlength\ecart{1.2cm-\esp}
\newcommand{\thepartimage}{}%
\newcommand{\partimage}[1]{\renewcommand{\thepartimage}{#1}}%
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax%
\refstepcounter{part}%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
\else%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}%
\fi%
\startcontents%
\markboth{}{}%
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[ocre!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north] at (4cm,-3.25cm){\color{ocre!40}\fontsize{220}{100}\sffamily\bfseries\thepart}; 
\node[anchor=south east] at (\paperwidth-1cm,-\paperheight+1cm){\parbox[t][][t]{8.5cm}{
\printcontents{l}{0}{\setcounter{tocdepth}{1}}% The depth to which the Part mini table of contents displays headings; 0 for chapters only, 1 for chapters and sections and 2 for chapters, sections and subsections
}};
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#2}};
\end{tikzpicture}};
\end{tikzpicture}}%
\@endpart}
\def\@spart#1{%
\startcontents%
\phantomsection
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[ocre!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#1}};
\end{tikzpicture}};
\end{tikzpicture}}
\addcontentsline{toc}{part}{\texorpdfstring{%
\setlength\fboxsep{0pt}%
\noindent\protect\colorbox{ocre!40}{\strut\protect\parbox[c][.7cm]{\linewidth}{\Large\sffamily\protect\centering #1\quad\mbox{}}}}{#1}}%
\@endpart}
\def\@endpart{\vfil\newpage
\if@twoside
\if@openright
\null
\thispagestyle{empty}%
\newpage
\fi
\fi
\if@tempswa
\twocolumn
\fi}

%-----------------------------------------------------------------------
%	                            Title Settings
%-----------------------------------------------------------------------

%% Useage: 
%% \titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]
%% ------------------------- Header and Footer  ------------------------
\newcommand\graysquare{\textcolor{sectcolor}{\rule{1ex}{1ex}}}
\newcommand{\helv}{\fontfamily{phv}\fontseries{}\fontsize{10}{12}\selectfont}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\fancyhf{}
\fancyhead[RO]{\helv\rightmark\hspace{0.5em}\graysquare\hspace{0.5em}\thepage}
\fancyhead[LE]{\helv\thepage\hspace{0.5em}\graysquare\hspace{0.5em}\leftmark}
\renewcommand{\headrulewidth}{0pt}

%% ----------------------------- Section  -------------------------------
\titleformat{\section}
{\normalfont\Large\bfseries}
{\llap{\colorbox{sectcolor}{\makebox[3em][r] {\thesection}}\hspace{1em}}}
{0em}{#1}


% ----------------------------------------------------------------------
%                         User Created Environments 
% ----------------------------------------------------------------------


%% ------------------------------ Epigraph  ----------------------------
%% https://tex.stackexchange.com/questions/65907/beautiful-quotes-in-documentclass-article
%% \usepackage{epigraph}
%% \usepackage{etoolbox}
\setlength\epigraphwidth{8cm}
\setlength\epigraphrule{0pt}

\makeatletter
\patchcmd{\epigraph}{\@epitext{#1}}{\itshape\@epitext{#1}}{}{}
\makeatother


%% ------------------------------ tcolorbox  ---------------------------
%% using \tcbset you can define a common style containing the settings 
%% that will be shared by your boxes
%% \usepackage{tcolorbox}
\tcbset{
    common/.style={ % Basic style
        % fontupper=\citshape,
        lower separated=false,
        % before upper={\setlength{\parindent}{\normalparindent}},
        coltitle=white,
        colback=gray!5,
        boxrule=0.5pt,
        fonttitle=\bfseries,
        enhanced,
        breakable,
        top=8pt,
        before skip=8pt,
        attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
        boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=0pt,
        outer arc=0pt},
        separator sign={.},},
    defstyle/.style={ % Definition style
        common,
        colframe=main,  
        colback=main!5,
        colbacktitle=main, 
        overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{main}{$\clubsuit$}};}},
    thmstyle/.style={ % Theoram style
        common,
        colframe=second,  
        colback=second!5,
        colbacktitle=second, 
        overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{second}{$\heartsuit$}};}},
    lmastyle/.style={ % Lemma style
        common,
        colframe=violet,  
        colback=violet!5,
        colbacktitle=violet, 
        overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{violet}{$\diamondsuit$}};}},
    corstyle/.style={ 
        common,
        colframe=purple,  
        colback=purple!5,
        colbacktitle=purple, 
        overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{purple}{$\diamondsuit$}};}},
    propstyle/.style={
        common,
        colframe=third,  
        colback=third!5,
        colbacktitle=third, 
        overlay unbroken and last={
            \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{third}{$\spadesuit$}};}},
    examstyle/.style={ % Example style
            breakable,
            enhanced,
            outer arc=0pt,
            arc=0pt,
            colframe=myblue,
            colback=myblue!20,
            attach boxed title to top left,
            boxed title style={
                colback=myblue,
                outer arc=0pt,
                arc=0pt,
                top=2pt,
                bottom=2pt,
                },
            fonttitle=\sffamily
            },
    example box/.style={ % Example Box Style
        common,
        breakable, 
        toggle enlargement=evenpage, 
        grow to right by=\marginparwidth+\marginparsep, 
        sidebyside, 
        lower separated=false, 
        if odd page={lefthand width=\textwidth-2.5mm-2pt, before lower app=\centering,}{before upper app=\centering, righthand width=\textwidth-2.5mm-2pt, sidebyside switch},% p.125 of manual
        boxrule=.5mm, 
        boxsep=1mm, 
        left=1pt,
        right=1pt,      
        sidebyside gap=\marginparsep+2mm+2pt, 
        fonttitle=\bfseries\Large, 
        code=\refstepcounter{mytcbcounter},
        title={Problem~\themytcbcounter{} #1}, 
        },
}
%------------------------------------------------
\newcommand{\definitionname}{Definition}
\DeclareTColorBox[auto counter,number within=chapter]{definition}{ o t\label g }{
    common,defstyle,
    IfValueTF={#1}{title={\definitionname~\thetcbcounter\ (#1)}}{title=\definitionname~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}
%------------------------------------------------
\newcommand{\theoremname}{Theorem}
\DeclareTColorBox[auto counter,number within=chapter]{theorem}{ o t\label g }{
    common,thmstyle,
    IfValueTF={#1}{title={\theoremname~\thetcbcounter\ (#1)}}{title=\theoremname~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}
%------------------------------------------------
\newcommand{\lemmaname}{Lemma}
\DeclareTColorBox[auto counter,number within=chapter]{lemma}{ o t\label g }{
    common,lmastyle,
    IfValueTF={#1}{title={\lemmaname~\thetcbcounter\ (#1)}}{title=\lemmaname~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}
%------------------------------------------------
\newcommand{\propositionname}{Proposition}
\DeclareTColorBox[auto counter,number within=chapter]{proposition}{ o t\label g }{
    common,propstyle,
    IfValueTF={#1}{title={\propositionname~\thetcbcounter\ (#1)}}{title=\propositionname~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}
%------------------------------------------------
\newcommand{\postulatename}{Postulate}
\DeclareTColorBox[auto counter,number within=chapter]{postulate}{ o t\label g }{
    common,thmstyle,
    IfValueTF={#1}{title={\postulatename~\thetcbcounter\ (#1)}}{title=\postulatename~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}
%------------------------------------------------
\newcommand{\corollaryname}{Corollary}
\DeclareTColorBox[auto counter,number within=chapter]{corollary}{ o t\label g }{
    common,corstyle,
    IfValueTF={#1}{title={\corollaryname~\thetcbcounter\ (#1)}}{title=\corollaryname~\thetcbcounter},
    IfBooleanTF={#2}{label=#3}{}}

%------------------------------------------------
\newtheoremstyle{mystyle}%
    {}%
    {}%
    {}%
    {}%
    {\sffamily\bfseries}%
    {.}%
    { }%
    {}%
\theoremstyle{mystyle}{
    \newtheorem*{remark}{Remark}
}
\tcolorboxenvironment{proof}{
    boxrule=0pt,
    boxsep=2pt,
    blanker,
    borderline west={2pt}{0pt}{black},
    before skip=10pt,
    after skip=10pt,
    left=8pt,
    right=12pt,
    breakable,
}
\renewenvironment{proof}{{\sffamily\bfseries Proof. }}{\qed}
\tcolorboxenvironment{remark}{
    boxrule=0pt,
    boxsep=2pt,
    blanker,
    borderline west={2pt}{0pt}{main},
    borderline east={2pt}{0pt}{main},
    before skip=10pt,
    after skip=10pt,
    left=12pt,
    right=12pt,
    breakable,
}
%------------------------------------------------
\newcommand{\examplename}{Example}
\NewTColorBox
[%
    use counter=mytcbcounter, 
]{examplebox}{ O{} +m }{%
    breakable, 
    toggle enlargement=evenpage, 
    grow to left by=\marginparwidth+\marginparsep, 
    sidebyside, 
    lower separated=false, 
    if odd page={lefthand width=\textwidth-2.5mm-2pt, before lower app=\centering,}{righthand width=\textwidth-2.5mm-2pt, before upper app=\centering},
    boxrule=.5mm, 
    boxsep=1mm, 
    left=1pt,
    right=1pt, 
    sidebyside gap=\marginparsep+2mm+2pt, 
    fonttitle=\bfseries\Large, 
    title={\examplename~\themytcbcounter #2}, 
    #1,
}
%------------------------------------------------
\newtcolorbox[auto counter]{example}[1][]{
  examstyle,
  colback=white,
  rightrule=0pt,
  toprule=0pt,
  title={\examplename~\thetcbcounter},
  overlay unbroken and first={
      \path
        let
        \p1=(title.north east),
        \p2=(frame.north east)
        in
        node[anchor=west,font=\sffamily,color=myblue,text width=\x2-\x1] 
        at (title.east) {#1};
  }
}

%------------------------------------------------
\newcounter{mytcbcounter}
\setcounter{mytcbcounter}{0}
\numberwithin{mytcbcounter}{chapter}

\newtcolorbox{tbox}[1]{
    colback=gray!5, colframe=gray, coltext=black,
    sharp corners, enhanced, breakable, parbox=false,
    before skip=1em, after skip=1em,
    title={#1}, fonttitle=\usefont{OT1}{phv}{b}{n}, 
    attach boxed title to top left={yshift=-0.1mm}, boxed title style={sharp corners, colback=gray, left=0.405cm},
    rightrule=-1pt,toprule=-1pt, bottomrule=-1pt
}

%% ------------------------------ Listings  ---------------------------
% \RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
% \definecolor{winered}{rgb}{0.5,0,0}
% \definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
% \definecolor{commentcolor}{RGB}{0,100,0}
% \definecolor{frenchplum}{RGB}{190,20,83}
\lstdefinestyle{estyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\footnotesize\fi
}
\lstset{basicstyle=\scriptsize\ttfamily,style=estyle}

\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{winered},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{winered},
	frame=tlbr,framesep=4pt,framerule=0pt,
	commentstyle=\color{commentcolor},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,cite,gbt7714,lang},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,zhdate,zhtoday},
	tabsize=2,
	backgroundcolor=\color{lightgrey}
}


% ----------------------------------------------------------------------
%           User Created Commands
% ----------------------------------------------------------------------
\renewcommand{\vec}[1]{\mathbold{#1}} % Lowercase italic bold for vectors
\newcommand{\mat}[1]{\mathbold{#1}} % Uppercase italic bold for matrices
\newcommand{\xint}{\int_{x_1}^{x_2}}
\newcommand{\del}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\deltwo}[2]{\frac{\partial^2 #1}{\partial #2^2}}
\newcommand{\ddx}[1]{\frac{d #1}{dx}}
\newcommand{\ddxx}[1]{\frac{d^2 #1}{dx^2}}

\newcommand\iid{\stackrel{\mathclap{\tiny\normalfont\mbox{i.i.d.}}}{\sim}}
\newcommand\defn{\stackrel{\mathclap{\tiny\Delta}}{=}}
\newcommand\E{\mathbb{E}}
\newcommand\Var{\mathrm{Var}}

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