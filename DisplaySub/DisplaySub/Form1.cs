using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Globalization;
using System.Text.RegularExpressions;

using System.Media;
using NAudio.Wave;
using NAudio.Wave.SampleProviders;
using System.Diagnostics;

namespace DisplaySub
{

    public partial class Form1 : Form
    {
        long m_iIndex;
        int m_iGlobalStart;
        int m_iGlobalEnd;
        int m_iTmpStart;
        int m_iTmpEnd;
        int m_iCurSentence;
        List<string> m_listSentences;
        bool is_Begin;
        bool is_Pause;
        bool is_CreateTimeForEachSentence;
        string m_sFileSubName;
        string m_sAudioName;
        string m_sPrefix;
        string m_sSubAll;
        TimeSpan m_timeStart;
        TimeSpan m_timeEnd;
        TimeSpan m_timeRunning;
        SoundPlayer m_song;
        long m_iTickCount;
        private AudioFileReader wave = null;
        private WaveOut outputSound = null;

        public Form1()
        {
            InitializeComponent();
            m_iIndex = 0;
            m_iGlobalStart = 0;
            m_iGlobalEnd = 0;
            m_iTmpStart = 0;
            m_iTmpEnd = 0;

            m_listSentences = new List<string>();
            is_Begin = false;
            m_iCurSentence = Convert.ToInt32( this.upDownIndex.Value);
            m_timeStart = TimeSpan.FromMilliseconds(0);
            is_CreateTimeForEachSentence = false;
            is_Pause = true;
            m_song = new SoundPlayer();
            m_iTickCount = 0;
            this.timerAudio.Interval = 200;//// 200 ms 
        }

        /// <summary>
        /// Open Sub file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenFile_Click(object sender, EventArgs e)
        {
            DialogResult dlgRsSub = this.dlgOpenSubFile.ShowDialog();
            if (DialogResult.OK == dlgRsSub)
            {
                m_sFileSubName = dlgOpenSubFile.FileName;
                this.tbxFileName.Text = m_sFileSubName;
            }
        }
        /// <summary>
        /// Open audio file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenAudio_Click(object sender, EventArgs e)
        {
            DialogResult dlgRsOpeAudio = this.dlgOpenAudioFile.ShowDialog();
            if (DialogResult.OK == dlgRsOpeAudio)
            {
                m_sAudioName = dlgOpenAudioFile.FileName;
                this.tbxAudioFile.Text = m_sAudioName;
            }
        }
        /// <summary>
        /// Run audio and syn time
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRun_Click(object sender, EventArgs e)
        {
            try
            {
                if (is_Pause)
                {
                    this.btnRun.Text = "PAUSE";
                    if (is_Begin)
                        m_iTmpEnd = Environment.TickCount & Int32.MaxValue;
                    is_Pause = false;
                    if (is_Begin)
                    {                
                        //audio thuong
                        //m_song.Play();
                        //this.timerAudio.Start();
                        //naudio
                        wave = new NAudio.Wave.AudioFileReader(this.tbxAudioFile.Text);
                        OffsetSampleProvider offsetSampleProvider = new OffsetSampleProvider(wave);
                        offsetSampleProvider.SkipOver = TimeSpan.FromMilliseconds(m_iTmpEnd);
                        //offsetSampleProvider.Take = TimeSpan.FromSeconds(timeTo - timeFrom);
                        outputSound = new WaveOut();
                        outputSound.Init(offsetSampleProvider);
                        outputSound.PlaybackStopped += OnPlaybackStopped; 
                    }
                }
                else
                {
                    this.btnRun.Text = "RUN";
                    is_Pause = true;

                    if (is_Begin)
                    {
                        //audio thuong
                        m_iTmpStart = Environment.TickCount & Int32.MaxValue;
                       // m_song.Stop();
                        //this.timerAudio.Stop();
                        m_iTickCount = 0;
                        //naudio
                        wave = new NAudio.Wave.AudioFileReader(this.tbxAudioFile.Text);
                        OffsetSampleProvider offsetSampleProvider = new OffsetSampleProvider(wave);
                        offsetSampleProvider.SkipOver = TimeSpan.FromMilliseconds(m_iTmpStart);
                        //offsetSampleProvider.Take = TimeSpan.FromSeconds(timeTo - timeFrom);
                        outputSound = new WaveOut();
                        outputSound.Init(offsetSampleProvider);
                        outputSound.Pause();
                    }
                }
                //// Index
                m_iIndex = Convert.ToInt64(this.upDownIndex.Value);

                if (!is_Begin)
                {
                    //// Load song
                    m_song.SoundLocation = m_sAudioName;
                    m_song.Load();
                    //// Load sub
                    m_sFileSubName = this.tbxFileName.Text;
                    if (m_sFileSubName.Length < 1) return;
                    string[] lines = System.IO.File.ReadAllLines(m_sFileSubName);
                    foreach (string sLine in lines)
                    {
                        string[] arrSentences = sLine.Split('.');
                        foreach (string sSentence in arrSentences)
                        {
                            if (sSentence.Length < 2) continue;
                            m_listSentences.Add(sSentence);
                        }
                    }
                    //// Sub file name
                    m_sPrefix = System.IO.Path.GetFileNameWithoutExtension(m_sFileSubName);
                    m_sSubAll = System.IO.Path.GetFileNameWithoutExtension(m_sFileSubName) + @"_All.txt";
                    System.IO.StreamWriter fileAll = new System.IO.StreamWriter(m_sSubAll, false);
                    fileAll.Close();

                    //// Display
                    m_iIndex = Convert.ToInt64(this.upDownIndex.Value);
                    this.tbxDisplay.Text = m_iIndex.ToString() +
                                            System.Environment.NewLine +
                                            @"--------------------------" +
                                            System.Environment.NewLine +
                                            m_listSentences[m_iCurSentence];
                    is_Begin = true;
                    //// Start time
                    m_iGlobalStart = Environment.TickCount & Int32.MaxValue;
                    int iHour = Convert.ToInt32(upDownHourBegin.Value);
                    int iMin = Convert.ToInt32(upDownMinBegin.Value);
                    int iSec = Convert.ToInt32(upDownSecBegin.Value);
                    int iMSec = Convert.ToInt32(upDownMsecBegin.Value);
                    long iMilisecond = (3600 * iHour + 60 * iMin + iSec) * 1000 + iMSec;
                    
                    //// Count time
                    m_timeStart = TimeSpan.FromMilliseconds(iMilisecond);
                    this.timerAudio.Start();

                    //// Run song
                    //m_song.Play();

                    //naudio
                    wave = new NAudio.Wave.AudioFileReader(this.tbxAudioFile.Text);
                    OffsetSampleProvider offsetSampleProvider = new OffsetSampleProvider(wave);
                    offsetSampleProvider.SkipOver = TimeSpan.FromMilliseconds(iMilisecond);
                    //offsetSampleProvider.Take = TimeSpan.FromSeconds(timeTo - timeFrom);
                    outputSound = new WaveOut();
                    outputSound.Init(offsetSampleProvider);
                    outputSound.Play();
                }

               
            }
            catch(Exception exc)
            {
                System.Windows.Forms.MessageBox.Show( exc.ToString(), "Error Click");
            }
        }

        /// <summary>
        /// Write sub file for each sentence
        /// </summary>
        /// <returns></returns>
        private int FuncWriteSrt(bool is_Write)
        {
            try
            {
                if (m_iCurSentence > m_listSentences.Count - 1)
                {
                    this.tbxDisplay.Text = "END OF SUB FILE";
                    return -1;
                }

                /// Update time                
                m_iGlobalEnd = Environment.TickCount & Int32.MaxValue ;

                /// Not include pause time
                /// Reduce 150 ms because user press a litte later after hearing sound
                int iMilisec = m_iGlobalEnd - m_iGlobalStart - (m_iTmpEnd - m_iTmpStart) - 150;
                TimeSpan timeDure = TimeSpan.FromMilliseconds(iMilisec);
                m_timeEnd = m_timeStart + timeDure;

                this.upDownHourBegin.Value = Convert.ToDecimal(m_timeStart.Hours);
                this.upDownMinBegin.Value = Convert.ToDecimal(m_timeStart.Minutes);
                this.upDownSecBegin.Value = Convert.ToDecimal(m_timeStart.Seconds);
                this.upDownMsecBegin.Value = Convert.ToDecimal(m_timeStart.Milliseconds);

                this.upDownHourEnd.Value = Convert.ToDecimal(m_timeEnd.Hours);
                this.upDownMinEnd.Value = Convert.ToDecimal(m_timeEnd.Minutes);
                this.upDownSecEnd.Value = Convert.ToDecimal(m_timeEnd.Seconds);
                this.upDownMsecEnd.Value = Convert.ToDecimal(m_timeEnd.Milliseconds);

              
                           
                //// Show time start of previous sentence
                string strTimeStart;
                if (m_timeStart.Hours < 10)
                    strTimeStart = @"0" + m_timeStart.Hours.ToString() + @":";
                else
                    strTimeStart = m_timeStart.Hours.ToString() + @":";
                if (m_timeStart.Minutes < 10)
                    strTimeStart += @"0" + m_timeStart.Minutes.ToString() + @":";
                else
                    strTimeStart +=  m_timeStart.Minutes.ToString() + @":";
                if (m_timeStart.Seconds < 10)
                    strTimeStart += @"0" + m_timeStart.Seconds.ToString() + @",";
                else
                    strTimeStart +=  m_timeStart.Seconds.ToString() + @",";

                if (m_timeStart.Milliseconds < 10)
                    strTimeStart += @"00" + m_timeStart.Milliseconds.ToString();
                else if (m_timeStart.Milliseconds < 100)
                    strTimeStart += @"0" + m_timeStart.Milliseconds.ToString();
                else
                    strTimeStart += m_timeStart.Milliseconds.ToString();

                //// Show time end of previous sentence
                string strTimeEnd;
                if (m_timeEnd.Hours < 10)
                    strTimeEnd = @"0" + m_timeEnd.Hours.ToString() + @":";
                else
                    strTimeEnd = m_timeEnd.Hours.ToString() + @":";
                if (m_timeEnd.Minutes < 10)
                    strTimeEnd += @"0" + m_timeEnd.Minutes.ToString() + @":";
                else
                    strTimeEnd += m_timeEnd.Minutes.ToString() + @":";
                if (m_timeEnd.Seconds < 10)
                    strTimeEnd += @"0" + m_timeEnd.Seconds.ToString() + @",";
                else
                    strTimeEnd += m_timeEnd.Seconds.ToString() + @",";

                if (m_timeEnd.Milliseconds < 10)
                    strTimeEnd += @"00" + m_timeEnd.Milliseconds.ToString();
                else if (m_timeEnd.Milliseconds < 100)
                    strTimeEnd += @"0" + m_timeEnd.Milliseconds.ToString();
                else
                    strTimeEnd += m_timeEnd.Milliseconds.ToString();

                //// Write time
                //// Save to file
                if (is_Write)
                {
                    System.IO.StreamWriter fileAll = new System.IO.StreamWriter(m_sSubAll, true);
                    fileAll.WriteLine(m_iIndex.ToString());
                    fileAll.WriteLine(strTimeStart.ToString() + " --> " + strTimeEnd.ToString());
                    fileAll.WriteLine(m_listSentences[m_iCurSentence]);
                    fileAll.WriteLine();
                    fileAll.Close();
                }
               

                if (is_Write && is_CreateTimeForEachSentence)
                {
                    string sFileOut = m_sPrefix + @"_" + m_iIndex.ToString() + @".txt";
                    System.IO.StreamWriter fileOut = new System.IO.StreamWriter(sFileOut);
                    fileOut.WriteLine(m_iIndex.ToString());
                    fileOut.WriteLine(m_timeStart.ToString() + "-->" + m_timeEnd.ToString());
                    fileOut.WriteLine(m_listSentences[m_iCurSentence]);
                    fileOut.Close();
                }

                //// New time, gap between sentences is 100 ms
                m_iGlobalStart = m_iGlobalEnd + 20;
                m_timeStart = m_timeEnd + TimeSpan.FromMilliseconds(20);

                //// Display new sentence                
                //m_iCurSentence++;
                do
                {
                    m_iCurSentence++;
                    if (m_iCurSentence > m_listSentences.Count - 1)
                    {
                        this.tbxDisplay.Text = "END OF SUB FILE";
                        return -1;
                    }
                } while (m_listSentences[m_iCurSentence].Length < 2);
                if (is_Write)
                {
                    this.upDownIndex.Value++;
                    m_iIndex = Convert.ToInt64(this.upDownIndex.Value);
                }
                this.tbxDisplay.Text = m_iIndex.ToString() +
                                        System.Environment.NewLine +
                                        @"--------------------------" +
                                        System.Environment.NewLine +
                                        m_listSentences[m_iCurSentence];
                
            }
            catch (Exception exc)
            {
                System.Windows.Forms.MessageBox.Show(exc.ToString(), "Error Write");
            }
            return 0;

        }
        /// <summary>
        /// Press run button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tbxDisplay_KeyPress(object sender, KeyPressEventArgs e)
        {
            try
            {
                if (!is_Begin) return;
                if (is_Pause) return;

                //// Write time
                if (e.KeyChar == (char)Keys.Space)
                {
                    FuncWriteSrt(true);
                    m_iTmpEnd = 0;
                    m_iTmpStart = 0;
                }
                //// Ignor Sentence
                if (e.KeyChar == 'N' || e.KeyChar == 'n')
                {
                    FuncWriteSrt(false);
                    m_iTmpEnd = 0;
                    m_iTmpStart = 0;
                }
            }
            catch(Exception exc)
            {
                System.Windows.Forms.MessageBox.Show(exc.ToString(), "Error");
            }
        }

        
        private void chbIsCreatSubFile_CheckedChanged(object sender, EventArgs e)
        {
            if (chbIsCreatSubFile.Checked)
                is_CreateTimeForEachSentence = true;
            else
                is_CreateTimeForEachSentence = false;
        }

        private void tbxDisplay_MouseClick(object sender, MouseEventArgs e)
        {
            this.tbxDisplay.BackColor = Color.Black;
            this.tbxDisplay.ForeColor = Color.White;
        }

        private void tbxDisplay_MouseLeave(object sender, EventArgs e)
        {
            //this.tbxDisplay.BackColor = Color.White;
            //this.tbxDisplay.ForeColor = Color.Red;
        }

        private void timerAudio_Tick(object sender, EventArgs e)
        {
            m_iTickCount++;
            m_timeRunning = TimeSpan.FromMilliseconds(timerAudio.Interval * m_iTickCount);
            string strRunningTime;
            if (m_timeRunning.Hours < 10)
                strRunningTime = @"0" + m_timeRunning.Hours.ToString() + @"h";
            else
                strRunningTime = m_timeRunning.Hours.ToString() + @"h";
            if (m_timeRunning.Minutes < 10)
                strRunningTime += @"0" + m_timeRunning.Minutes.ToString() + @"m";
            else
                strRunningTime += m_timeRunning.Minutes.ToString() + @"m";
            if (m_timeRunning.Seconds < 10)
                strRunningTime += @"0" + m_timeRunning.Seconds.ToString() + @"s";
            else
                strRunningTime += m_timeRunning.Seconds.ToString() + @"s";

            if (m_timeRunning.Milliseconds < 10)
                strRunningTime += @"00" + m_timeRunning.Milliseconds.ToString() + "ms";
            else if (m_timeRunning.Milliseconds < 100)
                strRunningTime += @"0" + m_timeRunning.Milliseconds.ToString() + "ms";
            else
                strRunningTime += m_timeRunning.Milliseconds.ToString() + "ms";


            this.tbxRunningTime.Text = strRunningTime;
        }

        void OnPlaybackStopped(object sender, StoppedEventArgs e)
        {
            // we want to be always on the GUI thread and be able to change GUI components
            Debug.Assert(!InvokeRequired, "PlaybackStopped on wrong thread");
            // we want it to be safe to clean up input stream and playback device in the handler for PlaybackStopped
            CleanUp();
            //EnableButtons(false);
            //timer1.Enabled = false;
            //labelNowTime.Text = "00:00";
            if (e.Exception != null)
            {
                MessageBox.Show(String.Format("Playback Stopped due to an error {0}", e.Exception.Message));
            }
        }

        private void CleanUp()
        {
            if (wave != null)
            {
                wave.Dispose();
                wave = null;
            }
            if (outputSound != null)
            {
                outputSound.Dispose();
                outputSound = null;
            }
        }

    }

}
