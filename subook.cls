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
\LoadClass[12pt,openany]{book}% here we use openany option to  remove a blank page that gets added automatically after \part{}

% ----------------------------------------------------------------------
%                   User Top Level Packages: Required
% ----------------------------------------------------------------------
\usepackage{varioref}

\usepackage{marginnote, % Margin note
            % sidenotes,
            fancyhdr, % Header and footer 
            geometry, % Required for adjusting page dimensions and margins
            }
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{xparse} % Parse arguments for macros
\usepackage{blindtext} % Exam the template
\usepackage{xpatch} % Patch LaTeX code in external packages
\usepackage{fontspec} % Change the font
\usepackage{libertine} % Libertin font
\usepackage[explicit]{titlesec} % Title setion
\usepackage{xcolor} % Get color
\usepackage{sidenotes}
\usepackage[many]{tcolorbox} % Colorful Box
\usepackage{tikz} % Drawing Picture
\usetikzlibrary{calc}
\usepackage{siunitx} %  Use the siunitx package to format all numbers, currencies, units, etc:
\usepackage{makeidx} % Required to make an index
\makeindex % Tells LaTeX to create the files required for indexing
% \usepackage{tocloft} % Required for manipulating the table of contents
% ----------------------------------------------------------------------
%           User Top Level Packages: Additional & Styling
% ----------------------------------------------------------------------

\usepackage{epigraph,
            etoolbox
            }
\usepackage{lipsum} % Random words
% \usepackage{minitoc} % Mini toc for each chapter
\usepackage{mathtools,amsthm,amssymb,amsfonts,bm}   % Math Presets
\usepackage{thmtools,amsmath}
\RequirePackage[colorlinks=true,
                linkcolor=black,
                % anchorcolor=Maroon,
                citecolor=brown,
                ]{hyperref}
\usepackage[
  style=gb7714-2015,
    autocite=footnote,
    backend=bibtex
  ]{biblatex}
\setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono}
% \usepackage{natbib} % 引入natbib包，参考文献格式相关
% % \setcitestyle{authoryear,open={(},close={)}} %Citation-related commands
% \bibliographystyle{unsrtnat}% set cite font 
% \usepackage{chapterbib}	% 引入chapterbib包，可以分章节显示参考文献，且参考文献编号各自独立
\usepackage{listings} % Quote
\usepackage{caption}
\usepackage{booktabs}
\usepackage{tabularx}
% \usepackage[UTF8]{ctex} % For Chinese support
\usepackage{float} % Float environment
\usepackage{algorithm} % Algorithm
\usepackage{algpseudocode} %  Algorithm

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


\newcommand{\fullwidthpage}{%
	\newgeometry{
    paper=a4paper,
		top=27.4mm,
		bottom=27.4mm,
		inner=24.8mm,
		outer=24.8mm,
		marginparwidth=0mm,
		marginparsep=0mm,
	}%
    % \recalchead%
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
\newcommand\BoxColor{ocre!60}

%----------------------------------------------------------------------------------------
%   MAIN TABLE OF CONTENTS
%----------------------------------------------------------------------------------------
\usetikzlibrary{tikzmark,calc,decorations.pathreplacing}
\definecolor{ocre}{RGB}{51,51,51}
\usepackage{titletoc}
\usepackage{graphicx}
\contentsmargin{0cm}

% Part text styling
\titlecontents{part}[0cm]
{\addvspace{20pt}\centering\large\bfseries}
{}
{}
{}


% % Chapter text styling
% \titlecontents{chapter}[1.25cm] % Indentation
% {\addvspace{12pt}\large\sffamily\bfseries} % Spacing and font options for chapters
% {\color{ocre!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{ocre}} % Chapter number
% {\color{ocre}}
% {\color{ocre!60}\normalsize\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number

% Section text styling
\titlecontents{section}[1.25cm] % Indentation
{\addvspace{3pt}\sffamily\bfseries} % Spacing and font options for sections
{\contentslabel[\thecontentslabel]{1.25cm}} % Section number
{}
{\hfill\color{black}\thecontentspage} % Page number
[]

% % Subsection text styling
% \titlecontents{subsection}[1.25cm] % Indentation
% {\addvspace{1pt}\sffamily\small} % Spacing and font options for subsections
% {\contentslabel[\thecontentslabel]{1.25cm}} % Subsection number
% {}
% {\ \titlerule*[.5pc]{.}\;\thecontentspage} % Page number
% []



% List of figures
\titlecontents{figure}[0em]
{\addvspace{-5pt}\sffamily}
{\thecontentslabel\hspace*{1em}}
{}
{\ \titlerule*[.5pc]{.}\;\thecontentspage}
[]

% List of tables
\titlecontents{table}[0em]
{\addvspace{-5pt}\sffamily}
{\thecontentslabel\hspace*{1em}}
{}
{\ \titlerule*[.5pc]{.}\;\thecontentspage}
[]

%----------------------------------------------------------------------------------------
%   SECTION NUMBERING IN THE MARGIN
%----------------------------------------------------------------------------------------

% \makeatletter
% \renewcommand{\@seccntformat}[1]{\llap{\textcolor{ocre}{\csname the#1\endcsname}\hspace{1em}}}
% \renewcommand{\section}{\@startsection{section}{1}{\z@}
% {-4ex \@plus -1ex \@minus -.4ex}
% {1ex \@plus.2ex }
% {\normalfont\large\sffamily\bfseries}}
% \renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
% {-3ex \@plus -0.1ex \@minus -.4ex}
% {0.5ex \@plus.2ex }
% {\normalfont\sffamily\bfseries}}
% \renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
% {-2ex \@plus -0.1ex \@minus -.2ex}
% {.2ex \@plus.2ex }
% {\normalfont\small\sffamily\bfseries}}
% \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
% {-2ex \@plus-.2ex \@minus .2ex}
% {.1ex}
% {\normalfont\small\sffamily\bfseries}}

% \newbibmacro{sidecite}{%
%   \printnames{labelname}%
%   \setunit{\printdelim{nametitledelim}}%
%   \printfield[citetitle]{labeltitle}%
%   \setunit{\addperiod\space}%
%   \printfield{year}}

% \makeatletter
% \DeclareCiteCommand{\cbx@textcite}
%   {\usebibmacro{textcite:init}}
%   {\usebibmacro{citeindex}%
%    \usebibmacro{textcite}%
%    \setunit{}%
%    \marginpar{\usebibmacro{sidecite}}%
%    \setunit{%
%      \ifbool{cbx:parens}
%        {\bibcloseparen\global\boolfalse{cbx:parens}}
%        {}%
%      \textcitedelim}}
%   {}
%   {\usebibmacro{textcite:postnote}}
% \makeatother

% \makeatletter
% \titleformat{\part}[display]
%   {\Huge\scshape\filright}
%   {\partname~\thepart:}
%   {20pt}
% \makeatother
% \setlength\epigraphwidth{.6\textwidth}

%----------------------------------------------------------------------------------------
%   PART HEADINGS
%----------------------------------------------------------------------------------------



% % numbered part in the table of contents
% \newcommand{\@mypartnumtocformat}[2]{%
%     \setlength
%     \fboxsep{0pt}%
%     \noindent\colorbox{black!20}{\strut\parbox[c][.7cm]{\ecart}{\color{black!70}\Large\sffamily\bfseries\centering#1}}\hskip\esp\colorbox{black!40}{\strut\parbox[c][.7cm]{\linewidth-\ecart-\esp}{\Large\sffamily\centering#2}}
% }%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % unnumbered part in the table of contents
% \newcommand{\@myparttocformat}[1]{%
% \setlength\fboxsep{0pt}%
% \noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}}%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newlength\esp
% \setlength\esp{4pt}
% \newlength\ecart
% \setlength\ecart{1.2cm-\esp}

% \newcommand{\thepartimage}{}%

% \newcommand{\partimage}[1]{
%     \renewcommand{\thepartimage}{#1}}%

% \def\@part[#1]#2{%
%     \ifnum \c@secnumdepth >-2\relax%
%         \refstepcounter{part}%
%         \addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
%     \else%
%     \addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}%
%     \fi%

%     \startcontents%
%     \markboth{}{}%
%     \thispagestyle{empty}%
%     % \begin{tikzpicture}[remember picture,overlay]%
%     %     \node at (current page.north west){
%     %         \begin{tikzpicture}[remember picture,overlay]%   
%     %         \fill[ocre!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
%     %         \node[anchor=north] at (4cm,-3.25cm)
%     %         {
%     %             \color{ocre!40}\fontsize{220}{100}\sffamily\bfseries\@Roman\c@part
%     %         };
%     %         \node[anchor=south east] at (\paperwidth-1cm,-\paperheight+1cm)
%     %         {
%     %             \parbox[t][][t]{8.5cm}{
%     %                 \printcontents{l}{0}{\setcounter{tocdepth}{1}}%
%     %             }
%     %         };
%     %         \node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm)
%     %         {
%     %             \parbox[t][][t]{15cm}{
%     %                 \strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#2}
%     %         };
%     %         \end{tikzpicture}
%     %     };
%     % \end{tikzpicture}
%     % }%
% \@endpart
% }




%----------------------------------------------------------------------------------------
%   CHAPTER HEADINGS
%----------------------------------------------------------------------------------------
\newlength{\myoddoffset}%
\setlength{\myoddoffset}{\marginparwidth + \marginparsep}%
\fancypagestyle{fancychapt}{%
  \fancyhf{}%
  \fancyfootoffset[rh]{\myoddoffset}%
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[L]{\footnotesize \thepage}%
}%
\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}

% Here we use 'numberless' key to set different numbered (without this key) and unnumbered (with numberless) variants
\titleformat{\chapter}[hang]{{\thispagestyle{fancychapt}}\Huge\bfseries}{\color{\Partcolor}#1  \marginnote{
  \begin{tcolorbox}[width=\marginparwidth,height=\marginparwidth/2,colback=\Partcolor,colframe=\Partcolor,center title,fonttitle=\bfseries\normalsize,title=\chaptertitlename,text fill]
    \begin{center}
    {\color{white}{\thechapter}}
    \end{center}
  \end{tcolorbox}
}[-1.5in]}{0pt}{\sffamily\Huge\bfseries}{}

\titleformat{name=\chapter,numberless}[block]{\normalfont\Huge\bfseries}{}{0pt}{#1}[\addcontentsline{toc}{chapter}{#1}]

% \titleformat{\section}
% {\normalfont\Large\bfseries}
% {\llap{\colorbox{sectcolor}{\makebox[3.5em][r] {\thesection}}\hspace{0.5em}}}
% {0em}{#1}

% \let\oldchapter\chapter
% \makeatletter
% \newcounter{@chaptnumdepth}
% \RenewDocumentCommand{\chapter}{s o m}{%
%   \IfBooleanTF{#1}
%     {\setcounter{@chaptnumdepth}{\value{chaptnumdepth}}% Store secnumdepth
%      \setcounter{chaptnumdepth}{0}% Print only up to \chapter numbers
%      \oldchapter{#3}% \section*
%      \setcounter{chaptnumdepth}{\value{@chaptnumdepth}}}% Restore secnumdepth
%     {\IfValueTF{#2}% \section
%        {\oldchapter[#2]{#3}}% \section[.]{..}
%        {\oldchapter{#3}}}% \section{..}
% }
% \makeatother


% \titleformat{\subsubsection}{\normalfont\normalsize\bfseries\color{\Partcolor}}

% \makeatletter
% \global\let\colorchapter\chapter
% \global\let\chapter\oldchapter
% \makeatother
% \newcounter{ToCPart}
% \let\old@l@part\l@part
% \let\old@l@\appendix\l@\appendix
% \renewcommand{\l@\appendix}{%
%   \stepcounter{part}%
%   \old@l@\appendix
% }

% \renewcommand{\l@chapter}[2]{%
%   \old@l@chapter{\color{\Partcolor}#1}{#2}}




% \def\@spart#1{%
%     \startcontents%
%     \phantomsection{
%         \thispagestyle{empty}%
%         \begin{tikzpicture}[remember picture,overlay]%
%             \node at (current page.north west)
%             {
%                 \begin{tikzpicture}[remember picture,overlay]%   
%                     \fill[ocre!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
%                     \node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){
%                         \parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#1}
%                     };
%                 \end{tikzpicture}};
%         \end{tikzpicture}
%     }

%     \addcontentsline{toc}{part}{\texorpdfstring
%     {%
%         \setlength\fboxsep{0pt}%
%         \noindent\protect\colorbox{ocre!40}{
%             \strut\protect\parbox[c][.7cm]{\linewidth}{\Large\sffamily\protect\centering #1\quad\mbox{}}
%         }
%     }{#1}}%
%     \@endpart
% }

% \def\@endpart
% {
%     \vfil\newpage
%         \if@twoside
%         \if@openright
%             \null
%             \thispagestyle{empty}%
%         \newpage
%         \fi
%     \fi
%     \if@tempswa
%         \twocolumn
%     \fi
% }

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
%% Useage: 
%% \titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]
\titleformat{\section}
{\normalfont\Large\bfseries}
{\llap{\colorbox{sectcolor}{\makebox[3.5em][r] {\thesection}}\hspace{0.5em}}}
{0em}{#1}




\titleformat{\subsubsection}
{\color{\Partcolor}\normalfont\normalsize\bfseries}
{\color{\Partcolor}\thesubsubsection}{1em}{#1}


% \titleformat{\paragraph}{\normalfont\normalsize\bfseries\color{\Partcolor}}{}{}{#1}{}

% ----------------------------------------------------------------------
%                         User Created Environments 
% ----------------------------------------------------------------------

%% ------------------------------ Marginnote  ----------------------------
\makeatletter
\long\def\@mn@@@marginnote[#1]#2[#3]{%
  \begingroup
    \ifmmode\mn@strut\let\@tempa\mn@vadjust\else
      \if@inlabel\leavevmode\fi
      \ifhmode\mn@strut\let\@tempa\mn@vadjust\else\let\@tempa\mn@vlap\fi
    \fi
    \@tempa{%
      \vbox to\z@{%
        \vss
        \@mn@margintest
        \if@reversemargin\if@tempswa
            \@tempswafalse
          \else
            \@tempswatrue
        \fi\fi
        %\if@tempswa
          \rlap{%
            \if@mn@verbose
              \PackageInfo{marginnote}{xpos seems to be \@mn@currxpos}%
            \fi
            \begingroup
              \ifx\@mn@currxpos\relax\else\ifx\@mn@currxpos\@empty\else
                  \kern-\dimexpr\@mn@currxpos\relax
              \fi\fi
              \ifx\@mn@currpage\relax
                \let\@mn@currpage\@ne
              \fi
              \if@twoside\ifodd\@mn@currpage\relax
                  \kern\oddsidemargin
                \else
                  \kern\evensidemargin
                \fi
              \else
                \kern\oddsidemargin
              \fi
              \kern 1in
            \endgroup
            \kern\marginnotetextwidth\kern\marginparsep
            \vbox to\z@{\kern\marginnotevadjust\kern #3
              \vbox to\z@{%
                \hsize\marginparwidth
                \linewidth\hsize
                \kern-\parskip
                \marginfont\raggedrightmarginnote\strut\hspace{\z@}%
                \ignorespaces#2\endgraf
                \vss}%
              \vss}%
          }%
      }%
    }%
  \endgroup
}
\makeatother

\newcommand{\mn}[1]{\marginnote{\normalfont\footnotesize #1}}
\newcommand{\sn}[1]{\sidenote{\footnotesize #1}}
%% ------------------------------ Caption  ----------------------------

%% caption number colored
\captionsetup[figure]{labelfont={color=main},font={footnotesize,color=gray!55!black}}
\captionsetup[table]{labelfont={color=main}}
%% caption x-x
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
%% https://tex.stackexchange.com/questions/69595/marginnote-always-on-right-side-of-the-page

%% caption in margin
\newcommand{\sidebysidecaption}[4]{%
\captionsetup{justification=raggedright}%
  \begin{minipage}[t]{#1}
    \vspace*{0pt}
    #3
  \end{minipage}
  \hfill%
  \begin{minipage}[t]{#2}
    \vspace*{0pt}
    #4
\end{minipage}%
}
%% https://tex.stackexchange.com/a/388469


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
\newtheorem{assumption}{Assumption}[section]
\newtheorem{exercise}{Exercise}[section]
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


%-----------------------------------
\newcommand{\key}[1]{\textbf{\color{main} #1}} %highlight sth

%% https://tex.stackexchange.com/a/576225
\makeatletter
\def\logosmaller#1{%
  \hbox{\sbox\z@ T%
    \vbox to\ht\z@{\hbox{\check@mathfonts
      \fontsize\sf@size\z@
      \math@fontsfalse\selectfont #1}\vss}}}
\newcommand\lecture{%
  L\kern-.2em%
  \logosmaller{E}\kern-.1em%
  C\kern-.2em%
  \raise0.5ex\hbox{T}\kern-.23em%
  \hbox{U}\kern-.1em%
  \lower0.1ex\logosmaller{R}\kern-.1em%
  E\@}


% Commands to print specific words always in the same way
% TODO: in \Command, automatically escape braces {} and replace backslashes with \textbackslash
\newcommand{\Class}[1]{\texttt{#1}}
\newcommand{\Package}[1]{\texttt{#1}}
\newcommand{\Option}[1]{\texttt{#1}}
\newcommand{\Command}[1]{\texttt{#1}}
\newcommand{\Environment}[1]{\texttt{#1}}
\newcommand{\Path}[1]{\texttt{#1}}



%% item
\renewcommand{\labelitemi}{\small$\blacktriangleright$}
\renewcommand{\labelitemii}{\textbullet}
\RequirePackage{enumitem}

\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\setlist[description]{noitemsep}



\newcommand{\sectionnameshort}{Sec.}

% Labelling commands
\newcommand{\labpage}[1]{\label{page:#1}}
\newcommand{\labpart}[1]{\label{part:#1}}
\newcommand{\labch}[1]{\label{ch:#1}}
\newcommand{\labsec}[1]{\label{sec:#1}}
\newcommand{\labsubsec}[1]{\label{subsec:#1}}
\newcommand{\labfig}[1]{\label{fig:#1}}
\newcommand{\labtab}[1]{\label{tab:#1}}
\newcommand{\labeq}[1]{\label{eq:#1}}
\newcommand{\labdef}[1]{\label{def:#1}}
\newcommand{\labthm}[1]{\label{thm:#1}}
\newcommand{\labassum}[1]{\label{assum:#1}}
\newcommand{\labprop}[1]{\label{prop:#1}}
\newcommand{\lablemma}[1]{\label{lemma:#1}}
\newcommand{\labremark}[1]{\label{remark:#1}}
\newcommand{\labexample}[1]{\label{example:#1}}
\newcommand{\labexercise}[1]{\label{exercise:#1}}


% Referencing commands
\newcommand{\refpage}[1]{\hyperref[#1]{\pagename}\xspace\pageref{page:#1}} % Page 84
\newcommand{\vrefpage}[1]{\vpageref*{page:#1}} % on the following page, on page 84

% For unnumbered parts
\newcommand{\arefpart}[1]{\hyperref[part:#1]{\partname}\xspace`\nameref{part:#1}'} % Part `Name of the Part'
\newcommand{\avrefpart}[1]{\hyperref[part:#1]{\partname}\xspace`\nameref{part:#1}' \vpageref{part:#1}} % Part `Name of the Part' on page 84

% For numbered parts
\newcommand{\refpart}[1]{\hyperref[part:#1]{\partname}\xspace\ref{part:#1}} % Part IV
\newcommand{\vrefpart}[1]{\hyperref[part:#1]{\partname}\xspace\vref{part:#1}} % Part IV, Part IV on the following page, Part IV on page 84
\newcommand{\nrefpart}[1]{\hyperref[part:#1]{\partname}\xspace\ref{part:#1} (\nameref{part:#1})}
\newcommand{\frefpart}[1]{\hyperref[part:#1]{\partname\xspace\ref{part:#1} (\nameref{part:#1}) \vpageref{part:#1}}} % Part IV (Name of the Part), Part IV (Name of the Part) on the following page, Part IV (Name of the Part) on page 84)

%\newcommand{\refch}[1]{\hyperref[#1]{\chaptername\xspace\usekomafont{chapter}\normalsize\nameref{ch:#1}}\xspace\vpageref{ch:#1}\,}
\newcommand{\refchshort}[1]{\hyperref[ch:#1]{\chapternameshort\xspace\ref{ch:#1}}}
\newcommand{\refch}[1]{\hyperref[ch:#1]{\chaptername\xspace\ref{ch:#1}}}
\newcommand{\vrefch}[1]{\hyperref[ch:#1]{\chaptername\xspace\ref{ch:#1} \vpageref{ch:#1}}}
\newcommand{\nrefch}[1]{\hyperref[ch:#1]{\chaptername\xspace\ref{ch:#1} (\nameref{ch:#1})}}
\newcommand{\frefch}[1]{\hyperref[ch:#1]{\chaptername\xspace\ref{ch:#1} (\nameref{ch:#1}) \vpageref{ch:#1}}}

%\newcommand{\refsec}[1]{Section~{\usekomafont{section}\normalsize\nameref{sec:#1}}\xspace\vpageref{sec:#1}\,}
\newcommand{\refsecshort}[1]{\hyperref[sec:#1]{\sectionnameshort\xspace\ref{sec:#1}}}
\newcommand{\refsec}[1]{\hyperref[sec:#1]{\sectionname\xspace\ref{sec:#1}}}
\newcommand{\vrefsec}[1]{\hyperref[sec:#1]{\sectionname\xspace\vref{sec:#1}}}
\newcommand{\nrefsec}[1]{\hyperref[sec:#1]{\sectionname\xspace\ref{sec:#1} (\nameref{sec:#1})}}
\newcommand{\frefsec}[1]{\hyperref[sec:#1]{\sectionname\xspace\ref{sec:#1} (\nameref{sec:#1}) \vpageref{sec:#1}}}

\newcommand{\refsubsecshort}[1]{\hyperref[subsec:#1]{\sectionnameshort\xspace\ref{subsec:#1}}}
\newcommand{\refsubsec}[1]{\hyperref[subsec:#1]{\subsectionname\xspace\ref{subsec:#1}}}
\newcommand{\vrefsubsec}[1]{\hyperref[subsec:#1]{\subsectionname\xspace\vref{subsec:#1}}}
\newcommand{\nrefsubsec}[1]{\hyperref[subsec:#1]{\subsectionname\xspace\ref{subsec:#1} (\nameref{subsec:#1})}}
\newcommand{\frefsubsec}[1]{\hyperref[subsec:#1]{\subsectionname\xspace\ref{subsec:#1} (\nameref{subsec:#1}) \vpageref{subsec:#1}}}

%\newcommand{\reffig}[1]{{\hypersetup{colorlinks=false}\usekomafont{captionlabel}\hyperref[fig:#1]{Figure}\xspace\ref{fig:#1}}}
\newcommand{\reffigshort}[1]{\hyperref[fig:#1]{\figurenameshort\xspace\ref{fig:#1}}}
\newcommand{\reffig}[1]{\hyperref[fig:#1]{\figurename}\xspace\ref{fig:#1}}
\newcommand{\vreffig}[1]{\hyperref[fig:#1]{\figurename\xspace\vref{fig:#1}}}

%\newcommand{\reftab}[1]{{\hypersetup{colorlinks=false}\usekomafont{captionlabel}\hyperref[tab:#1]{Table}\xspace\ref{tab:#1}}}
\newcommand{\reftab}[1]{\hyperref[tab:#1]{\tablename}\xspace\ref{tab:#1}}
\newcommand{\vreftab}[1]{\hyperref[tab:#1]{\tablename\xspace\vref{tab:#1}}}

\newcommand{\refeqshort}[1]{\hyperref[eq:#1]\eqnameshort\xspace(\ref{eq:#1})}
\renewcommand{\refeq}[1]{\hyperref[eq:#1]\eqname\xspace\ref{eq:#1}}
\newcommand{\vrefeq}[1]{\hyperref[eq:#1]\eqname\xspace\vref{eq:#1}}

\newcommand{\refdef}[1]{\hyperref[def:#1]\defname\xspace\ref{def:#1}}
\newcommand{\vrefdef}[1]{\hyperref[def:#1]\defname\xspace\vref{def:#1}}

\newcommand{\refassum}[1]{\hyperref[assum:#1]\assumname\xspace\ref{assum:#1}}
\newcommand{\vrefassum}[1]{\hyperref[assum:#1]\assumname\xspace\vref{assum:#1}}

\newcommand{\refthm}[1]{\hyperref[thm:#1]\thmname\xspace\ref{thm:#1}}
\newcommand{\vrefthm}[1]{\hyperref[thm:#1]\thmname\xspace\vref{thm:#1}}

\newcommand{\refprop}[1]{\hyperref[prop:#1]\propname\xspace\ref{prop:#1}}
\newcommand{\vrefprop}[1]{\hyperref[prop:#1]\propname\xspace\vref{prop:#1}}

\newcommand{\reflemma}[1]{\hyperref[lemma:#1]\lemmaname\xspace\ref{lemma:#1}}
\newcommand{\vreflemma}[1]{\hyperref[lemma:#1]\lemmaname\xspace\vref{lemma:#1}}

\newcommand{\refremark}[1]{\hyperref[remark:#1]\remarkname\xspace\ref{remark:#1}}
\newcommand{\vrefremark}[1]{\hyperref[remark:#1]\remarkname\xspace\vref{remark:#1}}

\newcommand{\refexample}[1]{\hyperref[example:#1]\examplename\xspace\ref{example:#1}}
\newcommand{\vrefexample}[1]{\hyperref[example:#1]\examplename\xspace\vref{example:#1}}

\newcommand{\refexercise}[1]{\hyperref[exercise:#1]\exercisename\xspace\ref{exercise:#1}}
\newcommand{\vrefexercise}[1]{\hyperref[exercise:#1]\exercisename\xspace\vref{exercise:#1}}


\newcommand{\sidecite}[1]{\cite{#1}\mn{\cite{#1}\citeauthor{#1}\citetitle{#1}}}