namespace DisplaySub
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.tbxDisplay = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.tbxRunningTime = new System.Windows.Forms.TextBox();
            this.chbIsCreatSubFile = new System.Windows.Forms.CheckBox();
            this.btnRun = new System.Windows.Forms.Button();
            this.gbxEndTime = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.upDownMsecEnd = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.upDownSecEnd = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            this.upDownMinEnd = new System.Windows.Forms.NumericUpDown();
            this.upDownHourEnd = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.grbStartTime = new System.Windows.Forms.GroupBox();
            this.lbMsecBegin = new System.Windows.Forms.Label();
            this.lbSec = new System.Windows.Forms.Label();
            this.upDownMsecBegin = new System.Windows.Forms.NumericUpDown();
            this.upDownSecBegin = new System.Windows.Forms.NumericUpDown();
            this.lbMin = new System.Windows.Forms.Label();
            this.upDownMinBegin = new System.Windows.Forms.NumericUpDown();
            this.upDownHourBegin = new System.Windows.Forms.NumericUpDown();
            this.lbHour = new System.Windows.Forms.Label();
            this.grbIndex = new System.Windows.Forms.GroupBox();
            this.upDownIndex = new System.Windows.Forms.NumericUpDown();
            this.gbxInputFile = new System.Windows.Forms.GroupBox();
            this.btnOpenFile = new System.Windows.Forms.Button();
            this.tbxFileName = new System.Windows.Forms.TextBox();
            this.grbInputAudio = new System.Windows.Forms.GroupBox();
            this.btnOpenAudio = new System.Windows.Forms.Button();
            this.tbxAudioFile = new System.Windows.Forms.TextBox();
            this.dlgOpenSubFile = new System.Windows.Forms.OpenFileDialog();
            this.dlgOpenAudioFile = new System.Windows.Forms.OpenFileDialog();
            this.timerAudio = new System.Windows.Forms.Timer(this.components);
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.gbxEndTime.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMsecEnd)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownSecEnd)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMinEnd)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownHourEnd)).BeginInit();
            this.grbStartTime.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMsecBegin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownSecBegin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMinBegin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownHourBegin)).BeginInit();
            this.grbIndex.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.upDownIndex)).BeginInit();
            this.gbxInputFile.SuspendLayout();
            this.grbInputAudio.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.tbxDisplay);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.panel1);
            this.splitContainer1.Panel2.Controls.Add(this.btnRun);
            this.splitContainer1.Panel2.Controls.Add(this.gbxEndTime);
            this.splitContainer1.Panel2.Controls.Add(this.grbStartTime);
            this.splitContainer1.Panel2.Controls.Add(this.grbIndex);
            this.splitContainer1.Panel2.Controls.Add(this.gbxInputFile);
            this.splitContainer1.Panel2.Controls.Add(this.grbInputAudio);
            this.splitContainer1.Size = new System.Drawing.Size(1023, 495);
            this.splitContainer1.SplitterDistance = 699;
            this.splitContainer1.TabIndex = 0;
            // 
            // tbxDisplay
            // 
            this.tbxDisplay.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbxDisplay.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbxDisplay.Location = new System.Drawing.Point(0, 0);
            this.tbxDisplay.Multiline = true;
            this.tbxDisplay.Name = "tbxDisplay";
            this.tbxDisplay.ReadOnly = true;
            this.tbxDisplay.Size = new System.Drawing.Size(699, 495);
            this.tbxDisplay.TabIndex = 0;
            this.tbxDisplay.MouseClick += new System.Windows.Forms.MouseEventHandler(this.tbxDisplay_MouseClick);
            this.tbxDisplay.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbxDisplay_KeyPress);
            this.tbxDisplay.MouseLeave += new System.EventHandler(this.tbxDisplay_MouseLeave);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.flowLayoutPanel1);
            this.panel1.Controls.Add(this.tbxRunningTime);
            this.panel1.Controls.Add(this.chbIsCreatSubFile);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 338);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(320, 114);
            this.panel1.TabIndex = 5;
            // 
            // tbxRunningTime
            // 
            this.tbxRunningTime.Location = new System.Drawing.Point(3, 30);
            this.tbxRunningTime.Name = "tbxRunningTime";
            this.tbxRunningTime.Size = new System.Drawing.Size(230, 20);
            this.tbxRunningTime.TabIndex = 1;
            // 
            // chbIsCreatSubFile
            // 
            this.chbIsCreatSubFile.AutoSize = true;
            this.chbIsCreatSubFile.Location = new System.Drawing.Point(6, 7);
            this.chbIsCreatSubFile.Name = "chbIsCreatSubFile";
            this.chbIsCreatSubFile.Size = new System.Drawing.Size(178, 17);
            this.chbIsCreatSubFile.TabIndex = 0;
            this.chbIsCreatSubFile.Text = "Create Time For Each Sentence";
            this.chbIsCreatSubFile.UseVisualStyleBackColor = true;
            this.chbIsCreatSubFile.CheckedChanged += new System.EventHandler(this.chbIsCreatSubFile_CheckedChanged);
            // 
            // btnRun
            // 
            this.btnRun.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnRun.Location = new System.Drawing.Point(0, 452);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(320, 43);
            this.btnRun.TabIndex = 3;
            this.btnRun.Text = "RUN";
            this.btnRun.UseVisualStyleBackColor = true;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // gbxEndTime
            // 
            this.gbxEndTime.Controls.Add(this.label4);
            this.gbxEndTime.Controls.Add(this.upDownMsecEnd);
            this.gbxEndTime.Controls.Add(this.label1);
            this.gbxEndTime.Controls.Add(this.upDownSecEnd);
            this.gbxEndTime.Controls.Add(this.label2);
            this.gbxEndTime.Controls.Add(this.upDownMinEnd);
            this.gbxEndTime.Controls.Add(this.upDownHourEnd);
            this.gbxEndTime.Controls.Add(this.label3);
            this.gbxEndTime.Dock = System.Windows.Forms.DockStyle.Top;
            this.gbxEndTime.Location = new System.Drawing.Point(0, 238);
            this.gbxEndTime.Name = "gbxEndTime";
            this.gbxEndTime.Size = new System.Drawing.Size(320, 94);
            this.gbxEndTime.TabIndex = 1;
            this.gbxEndTime.TabStop = false;
            this.gbxEndTime.Text = "End Time";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(284, 30);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(20, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "ms";
            // 
            // upDownMsecEnd
            // 
            this.upDownMsecEnd.Location = new System.Drawing.Point(227, 28);
            this.upDownMsecEnd.Maximum = new decimal(new int[] {
            999,
            0,
            0,
            0});
            this.upDownMsecEnd.Name = "upDownMsecEnd";
            this.upDownMsecEnd.Size = new System.Drawing.Size(41, 20);
            this.upDownMsecEnd.TabIndex = 8;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(209, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(12, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "s";
            // 
            // upDownSecEnd
            // 
            this.upDownSecEnd.Location = new System.Drawing.Point(152, 28);
            this.upDownSecEnd.Maximum = new decimal(new int[] {
            60,
            0,
            0,
            0});
            this.upDownSecEnd.Name = "upDownSecEnd";
            this.upDownSecEnd.Size = new System.Drawing.Size(41, 20);
            this.upDownSecEnd.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(119, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(15, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "m";
            // 
            // upDownMinEnd
            // 
            this.upDownMinEnd.Location = new System.Drawing.Point(69, 28);
            this.upDownMinEnd.Maximum = new decimal(new int[] {
            60,
            0,
            0,
            0});
            this.upDownMinEnd.Name = "upDownMinEnd";
            this.upDownMinEnd.Size = new System.Drawing.Size(44, 20);
            this.upDownMinEnd.TabIndex = 2;
            // 
            // upDownHourEnd
            // 
            this.upDownHourEnd.Location = new System.Drawing.Point(6, 28);
            this.upDownHourEnd.Maximum = new decimal(new int[] {
            24,
            0,
            0,
            0});
            this.upDownHourEnd.Name = "upDownHourEnd";
            this.upDownHourEnd.Size = new System.Drawing.Size(38, 20);
            this.upDownHourEnd.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(50, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(13, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "h";
            // 
            // grbStartTime
            // 
            this.grbStartTime.Controls.Add(this.lbMsecBegin);
            this.grbStartTime.Controls.Add(this.lbSec);
            this.grbStartTime.Controls.Add(this.upDownMsecBegin);
            this.grbStartTime.Controls.Add(this.upDownSecBegin);
            this.grbStartTime.Controls.Add(this.lbMin);
            this.grbStartTime.Controls.Add(this.upDownMinBegin);
            this.grbStartTime.Controls.Add(this.upDownHourBegin);
            this.grbStartTime.Controls.Add(this.lbHour);
            this.grbStartTime.Dock = System.Windows.Forms.DockStyle.Top;
            this.grbStartTime.Location = new System.Drawing.Point(0, 151);
            this.grbStartTime.Name = "grbStartTime";
            this.grbStartTime.Size = new System.Drawing.Size(320, 87);
            this.grbStartTime.TabIndex = 0;
            this.grbStartTime.TabStop = false;
            this.grbStartTime.Text = "Begin Time";
            // 
            // lbMsecBegin
            // 
            this.lbMsecBegin.AutoSize = true;
            this.lbMsecBegin.Location = new System.Drawing.Point(284, 30);
            this.lbMsecBegin.Name = "lbMsecBegin";
            this.lbMsecBegin.Size = new System.Drawing.Size(20, 13);
            this.lbMsecBegin.TabIndex = 7;
            this.lbMsecBegin.Text = "ms";
            // 
            // lbSec
            // 
            this.lbSec.AutoSize = true;
            this.lbSec.Location = new System.Drawing.Point(209, 30);
            this.lbSec.Name = "lbSec";
            this.lbSec.Size = new System.Drawing.Size(12, 13);
            this.lbSec.TabIndex = 5;
            this.lbSec.Text = "s";
            // 
            // upDownMsecBegin
            // 
            this.upDownMsecBegin.Location = new System.Drawing.Point(227, 28);
            this.upDownMsecBegin.Maximum = new decimal(new int[] {
            999,
            0,
            0,
            0});
            this.upDownMsecBegin.Name = "upDownMsecBegin";
            this.upDownMsecBegin.Size = new System.Drawing.Size(41, 20);
            this.upDownMsecBegin.TabIndex = 6;
            // 
            // upDownSecBegin
            // 
            this.upDownSecBegin.Location = new System.Drawing.Point(152, 28);
            this.upDownSecBegin.Maximum = new decimal(new int[] {
            60,
            0,
            0,
            0});
            this.upDownSecBegin.Name = "upDownSecBegin";
            this.upDownSecBegin.Size = new System.Drawing.Size(41, 20);
            this.upDownSecBegin.TabIndex = 4;
            // 
            // lbMin
            // 
            this.lbMin.AutoSize = true;
            this.lbMin.Location = new System.Drawing.Point(119, 30);
            this.lbMin.Name = "lbMin";
            this.lbMin.Size = new System.Drawing.Size(15, 13);
            this.lbMin.TabIndex = 3;
            this.lbMin.Text = "m";
            // 
            // upDownMinBegin
            // 
            this.upDownMinBegin.Location = new System.Drawing.Point(69, 28);
            this.upDownMinBegin.Maximum = new decimal(new int[] {
            60,
            0,
            0,
            0});
            this.upDownMinBegin.Name = "upDownMinBegin";
            this.upDownMinBegin.Size = new System.Drawing.Size(44, 20);
            this.upDownMinBegin.TabIndex = 2;
            // 
            // upDownHourBegin
            // 
            this.upDownHourBegin.Location = new System.Drawing.Point(6, 28);
            this.upDownHourBegin.Maximum = new decimal(new int[] {
            24,
            0,
            0,
            0});
            this.upDownHourBegin.Name = "upDownHourBegin";
            this.upDownHourBegin.Size = new System.Drawing.Size(38, 20);
            this.upDownHourBegin.TabIndex = 1;
            // 
            // lbHour
            // 
            this.lbHour.AutoSize = true;
            this.lbHour.Location = new System.Drawing.Point(50, 30);
            this.lbHour.Name = "lbHour";
            this.lbHour.Size = new System.Drawing.Size(13, 13);
            this.lbHour.TabIndex = 0;
            this.lbHour.Text = "h";
            // 
            // grbIndex
            // 
            this.grbIndex.Controls.Add(this.upDownIndex);
            this.grbIndex.Dock = System.Windows.Forms.DockStyle.Top;
            this.grbIndex.Location = new System.Drawing.Point(0, 101);
            this.grbIndex.Name = "grbIndex";
            this.grbIndex.Size = new System.Drawing.Size(320, 50);
            this.grbIndex.TabIndex = 2;
            this.grbIndex.TabStop = false;
            this.grbIndex.Text = "Index Of Sentence";
            // 
            // upDownIndex
            // 
            this.upDownIndex.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.upDownIndex.Location = new System.Drawing.Point(3, 27);
            this.upDownIndex.Maximum = new decimal(new int[] {
            999999999,
            0,
            0,
            0});
            this.upDownIndex.Name = "upDownIndex";
            this.upDownIndex.Size = new System.Drawing.Size(314, 20);
            this.upDownIndex.TabIndex = 0;
            // 
            // gbxInputFile
            // 
            this.gbxInputFile.Controls.Add(this.btnOpenFile);
            this.gbxInputFile.Controls.Add(this.tbxFileName);
            this.gbxInputFile.Dock = System.Windows.Forms.DockStyle.Top;
            this.gbxInputFile.Location = new System.Drawing.Point(0, 52);
            this.gbxInputFile.Name = "gbxInputFile";
            this.gbxInputFile.Size = new System.Drawing.Size(320, 49);
            this.gbxInputFile.TabIndex = 4;
            this.gbxInputFile.TabStop = false;
            this.gbxInputFile.Text = "Input Sub File";
            // 
            // btnOpenFile
            // 
            this.btnOpenFile.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnOpenFile.Location = new System.Drawing.Point(236, 16);
            this.btnOpenFile.Name = "btnOpenFile";
            this.btnOpenFile.Size = new System.Drawing.Size(81, 30);
            this.btnOpenFile.TabIndex = 1;
            this.btnOpenFile.Text = "Open Sub";
            this.btnOpenFile.UseVisualStyleBackColor = true;
            this.btnOpenFile.Click += new System.EventHandler(this.btnOpenFile_Click);
            // 
            // tbxFileName
            // 
            this.tbxFileName.AllowDrop = true;
            this.tbxFileName.Dock = System.Windows.Forms.DockStyle.Left;
            this.tbxFileName.Location = new System.Drawing.Point(3, 16);
            this.tbxFileName.Multiline = true;
            this.tbxFileName.Name = "tbxFileName";
            this.tbxFileName.Size = new System.Drawing.Size(233, 30);
            this.tbxFileName.TabIndex = 0;
            // 
            // grbInputAudio
            // 
            this.grbInputAudio.Controls.Add(this.btnOpenAudio);
            this.grbInputAudio.Controls.Add(this.tbxAudioFile);
            this.grbInputAudio.Dock = System.Windows.Forms.DockStyle.Top;
            this.grbInputAudio.Location = new System.Drawing.Point(0, 0);
            this.grbInputAudio.Name = "grbInputAudio";
            this.grbInputAudio.Size = new System.Drawing.Size(320, 52);
            this.grbInputAudio.TabIndex = 6;
            this.grbInputAudio.TabStop = false;
            this.grbInputAudio.Text = "Input Audio File";
            // 
            // btnOpenAudio
            // 
            this.btnOpenAudio.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnOpenAudio.Location = new System.Drawing.Point(236, 16);
            this.btnOpenAudio.Name = "btnOpenAudio";
            this.btnOpenAudio.Size = new System.Drawing.Size(81, 33);
            this.btnOpenAudio.TabIndex = 1;
            this.btnOpenAudio.Text = "Open Audio";
            this.btnOpenAudio.UseVisualStyleBackColor = true;
            this.btnOpenAudio.Click += new System.EventHandler(this.btnOpenAudio_Click);
            // 
            // tbxAudioFile
            // 
            this.tbxAudioFile.AllowDrop = true;
            this.tbxAudioFile.Dock = System.Windows.Forms.DockStyle.Left;
            this.tbxAudioFile.Location = new System.Drawing.Point(3, 16);
            this.tbxAudioFile.Multiline = true;
            this.tbxAudioFile.Name = "tbxAudioFile";
            this.tbxAudioFile.Size = new System.Drawing.Size(233, 33);
            this.tbxAudioFile.TabIndex = 0;
            // 
            // dlgOpenSubFile
            // 
            this.dlgOpenSubFile.FileName = "Choose Sub File";
            this.dlgOpenSubFile.Filter = "(*.txt)|*.txt";
            // 
            // dlgOpenAudioFile
            // 
            this.dlgOpenAudioFile.FileName = "Open Audio File";
            this.dlgOpenAudioFile.Filter = "*.wav|*.wav";
            // 
            // timerAudio
            // 
            this.timerAudio.Tick += new System.EventHandler(this.timerAudio_Tick);
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Location = new System.Drawing.Point(3, 57);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(314, 54);
            this.flowLayoutPanel1.TabIndex = 2;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1023, 495);
            this.Controls.Add(this.splitContainer1);
            this.Name = "Form1";
            this.Text = "Press Space For Next Sentence";
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.gbxEndTime.ResumeLayout(false);
            this.gbxEndTime.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMsecEnd)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownSecEnd)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMinEnd)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownHourEnd)).EndInit();
            this.grbStartTime.ResumeLayout(false);
            this.grbStartTime.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMsecBegin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownSecBegin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownMinBegin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.upDownHourBegin)).EndInit();
            this.grbIndex.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.upDownIndex)).EndInit();
            this.gbxInputFile.ResumeLayout(false);
            this.gbxInputFile.PerformLayout();
            this.grbInputAudio.ResumeLayout(false);
            this.grbInputAudio.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TextBox tbxDisplay;
        private System.Windows.Forms.GroupBox grbStartTime;
        private System.Windows.Forms.NumericUpDown upDownHourBegin;
        private System.Windows.Forms.Label lbHour;
        private System.Windows.Forms.Label lbMin;
        private System.Windows.Forms.NumericUpDown upDownMinBegin;
        private System.Windows.Forms.Label lbSec;
        private System.Windows.Forms.NumericUpDown upDownSecBegin;
        private System.Windows.Forms.GroupBox gbxEndTime;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown upDownSecEnd;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown upDownMinEnd;
        private System.Windows.Forms.NumericUpDown upDownHourEnd;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox grbIndex;
        private System.Windows.Forms.NumericUpDown upDownIndex;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.GroupBox gbxInputFile;
        private System.Windows.Forms.Button btnOpenFile;
        private System.Windows.Forms.TextBox tbxFileName;
        private System.Windows.Forms.OpenFileDialog dlgOpenSubFile;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown upDownMsecEnd;
        private System.Windows.Forms.Label lbMsecBegin;
        private System.Windows.Forms.NumericUpDown upDownMsecBegin;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.CheckBox chbIsCreatSubFile;
        private System.Windows.Forms.GroupBox grbInputAudio;
        private System.Windows.Forms.Button btnOpenAudio;
        private System.Windows.Forms.TextBox tbxAudioFile;
        private System.Windows.Forms.OpenFileDialog dlgOpenAudioFile;
        private System.Windows.Forms.Timer timerAudio;
        private System.Windows.Forms.TextBox tbxRunningTime;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
    }
}

