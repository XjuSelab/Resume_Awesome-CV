%% Start of file `awesome-cv.cls'.
%% 基于 Awesome CV Class 进行的定制化精简版
%% 
%% 修改说明 (2025/11/24 v2.1 Debug版)：
%% 1. 修复了 cventry 之间的重叠问题 (Project Name 压住上一行文字)
%% 2. 移除了 cvitems 底部的激进负间距
%% 3. 增加了条目间的呼吸感

%-------------------------------------------------------------------------------
%                标识与类定义
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}[2025/11/24 v2.1 Customized Awesome CV Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                核心依赖包加载
%-------------------------------------------------------------------------------
\RequirePackage{array}       % 增强表格功能
\RequirePackage{enumitem}    % 增强列表功能
\RequirePackage{ragged2e}    % 控制文本对齐
\RequirePackage{geometry}    % 页面页边距设置
\RequirePackage{fancyhdr}    % 页眉页脚设置
\RequirePackage{parskip}     % 处理段落间距
\RequirePackage{xifthen}     % 条件判断
\RequirePackage{etoolbox}    % 编程工具箱
\RequirePackage{ifxetex}     % 检测编译引擎
\RequirePackage{xcolor}      % 颜色支持
\RequirePackage[quiet]{fontspec} % 字体管理
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{unicode-math}% 数学字体
\RequirePackage{fontawesome} % 图标库
\RequirePackage[default,opentype]{sourcesanspro} % 英文字体
\RequirePackage[skins]{tcolorbox} % 绘图框
\RequirePackage[hidelinks,unicode]{hyperref} % 超链接

\hypersetup{
  pdftitle={Resume/CV},
  pdfauthor={Author},
  pdfsubject={CV},
  pdfkeywords={CV, Resume}
}


%-------------------------------------------------------------------------------
%                配置部分
%-------------------------------------------------------------------------------
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

% 颜色定义
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

\def\@sectioncolor#1#2{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2}}{#1#2}%
}


%-------------------------------------------------------------------------------
%                字体与样式
%-------------------------------------------------------------------------------
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

% 样式定义
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{28pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{28pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}


%-------------------------------------------------------------------------------
%                个人信息命令
%-------------------------------------------------------------------------------
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}{\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}{\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}{\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}
\newcommand*{\xing}[1]{\def\@xing{#1}}
\newcommand*{\medium}[1]{\def\@medium{#1}}
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{\def\@googlescholarname{\@firstname~\@lastname}}{\def\@googlescholarname{#2}}%
}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}


%-------------------------------------------------------------------------------
%                微调参数
%-------------------------------------------------------------------------------
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                核心渲染逻辑
%-------------------------------------------------------------------------------

% 1. 头部
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \newlength{\photowidth}
      \newlength{\photoheight}
      \ifthenelse{\equal{\@photoshape}{circle}}{%
        \setlength{\photodim}{1.3cm}%
      }{%
        \setlength{\photowidth}{2.5cm}%
        \setlength{\photoheight}{3.5cm}%
      }%
      \ifthenelse{\equal{\@photoedge}{edge}}{\def\@photoborder{darkgray}}{\def\@photoborder{none}}%
      \ifthenelse{\equal{\@photoshape}{circle}}{%
        \begin{tikzpicture}[baseline={(0,0)}]%
          \node[circle, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};%
        \end{tikzpicture}%
      }{%
        \fcolorbox{\@photoborder}{white}{\includegraphics[width=\photowidth,height=\photoheight]{\@photo}}%
      }%
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.82\textwidth} 
    \setlength{\headerphotowidth}{0.18\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \raggedright
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}\setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}{}{\faMobile\acvHeaderIconSep\@mobile\setbool{isstart}{false}}%
      \ifthenelse{\isundefined{\@email}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}}%
      \ifthenelse{\isundefined{\@homepage}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{http://\@homepage}{\faHome\acvHeaderIconSep\@homepage}}%
      \ifthenelse{\isundefined{\@github}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}}%
      \ifthenelse{\isundefined{\@gitlab}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}}%
      \ifthenelse{\isundefined{\@stackoverflowid}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}}%
      \ifthenelse{\isundefined{\@linkedin}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\acvHeaderIconSep\@linkedin}}%
      \ifthenelse{\isundefined{\@twitter}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}}%
      \ifthenelse{\isundefined{\@skype}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\faSkype\acvHeaderIconSep\@skype}%
      \ifthenelse{\isundefined{\@reddit}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}}%
      \ifthenelse{\isundefined{\@xing}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}}%
      \ifthenelse{\isundefined{\@medium}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://medium.com/@\@medium}{\faMedium\acvHeaderIconSep\@medium}}%
      \ifthenelse{\isundefined{\@googlescholarid}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}}%
      \ifthenelse{\isundefined{\@extrainfo}}{}{\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\@extrainfo}%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}{}{\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% 2. 页脚
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% 3. 章节
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{gray}\vhrulefill{0.9pt}
}

\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

% --- [核心修复位置] 渲染单个条目 ---
\newcommand*{\cventry}[5]{%
  \vspace{-1.0mm} % 减少顶部的负间距 (原为 -2.0mm)
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 6cm} R{6cm}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
  \par\addvspace{2.5mm} % <--- [新增] 强制增加条目之间的垂直间距，解决重叠问题
}

\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% --- [核心修复位置] 渲染列表项 ---
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  % \vspace{-4.0mm} % <--- [删除] 移除了底部的负间距，防止下一段文字被过度上拉
}