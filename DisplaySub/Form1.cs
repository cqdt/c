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
        int[] m_listTimeStart;
        int[] m_listTimeEnd;
        List<string> m_listSentences;
        bool is_Begin;
        string m_sFileName;
        string m_sPrefix;

        TimeSpan m_timeStart;
        TimeSpan m_timeEnd;
        public Form1()
        {
            InitializeComponent();
            m_iIndex = 0;
            m_iGlobalStart = 0;
            m_iGlobalEnd = 0;
            m_iTmpStart = 0;
            m_iTmpEnd = 0;
            m_listTimeStart = new int[4];
            m_listTimeEnd = new int[4];
            m_listSentences = new List<string>();
            is_Begin = false;
            m_iCurSentence = 0;
            m_timeStart = TimeSpan.FromMilliseconds(0);
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            try
            {
                //// Index
                m_iIndex = Convert.ToInt64(this.upDownIndex.Value);
                m_listTimeStart[0] = Convert.ToInt32(this.upDownHourBegin.Value);
                m_listTimeStart[1] = Convert.ToInt32(this.upDownMinBegin.Value);
                m_listTimeStart[2] = Convert.ToInt32(this.upDownSecBegin.Value);
                m_listTimeStart[3] = Convert.ToInt32(this.upDownMsecBegin.Value);

                m_listTimeEnd[0] = Convert.ToInt32(this.upDownHourEnd.Value);
                m_listTimeEnd[1] = Convert.ToInt32(this.upDownMinEnd.Value);
                m_listTimeEnd[2] = Convert.ToInt32(this.upDownSecEnd.Value);
                m_listTimeEnd[3] = Convert.ToInt32(this.upDownMsecEnd.Value);

                if (!is_Begin)
                {
                    m_sFileName = this.tbxFileName.Text;
                    if (m_sFileName.Length < 1) return;
                    string[] lines = System.IO.File.ReadAllLines(m_sFileName);
                    foreach (string sLine in lines)
                    {
                        string[] arrSentences = sLine.Split('.');
                        foreach (string sSentence in arrSentences)
                            m_listSentences.Add(sSentence);
                    }

                    m_sPrefix = System.IO.Path.GetFileNameWithoutExtension(m_sFileName);
                    m_iIndex = Convert.ToInt64(this.upDownIndex.Value);
                    this.tbxDisplay.Text = m_iIndex.ToString() +
                                            System.Environment.NewLine +
                                            @"--------------------------" +
                                            System.Environment.NewLine +
                                            m_listSentences[m_iCurSentence];
                    is_Begin = true;
                    m_iGlobalStart = Environment.TickCount & Int32.MaxValue; ;
                }
            }
            catch(Exception exc)
            {
                System.Windows.Forms.MessageBox.Show( exc.ToString(), "Error");
            }
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
                if (e.KeyChar == (char)Keys.Space)
                {
                    /// Update time
                    m_iGlobalEnd = Environment.TickCount & Int32.MaxValue;
                    int iMilisec = m_iGlobalEnd - m_iGlobalStart;
                    TimeSpan timeDure = TimeSpan.FromMilliseconds(iMilisec);
                    m_timeEnd = m_timeStart + timeDure;

                    //int iSecond = iMilisec / 1000;
                    //int idHour = iSecond / 3600;

                    //int iMin = iSecond - idHour * 3600;
                    //int idMin = iMin / 60;

                    //int idSec = iSecond - idHour * 3600 - idMin * 60;
                    //int idMsec = iMilisec - iSecond * 1000;

                    //m_listTimeEnd[0] = m_listTimeStart[0] + idHour;
                    //m_listTimeEnd[1] = m_listTimeStart[2] + idMin;
                    //m_listTimeEnd[2] = m_listTimeStart[2] + idSec;
                    //m_listTimeEnd[3] = m_listTimeStart[3] + idMsec;

                    //this.upDownHourBegin.Value = Convert.ToDecimal(m_listTimeStart[0]);
                    //this.upDownMinBegin.Value = Convert.ToDecimal(m_listTimeStart[1]);
                    //this.upDownSecBegin.Value = Convert.ToDecimal(m_listTimeStart[2]);
                    //this.upDownMsecBegin.Value = Convert.ToDecimal(m_listTimeStart[3]);

                    //this.upDownHourEnd.Value = Convert.ToDecimal(m_listTimeEnd[0]);
                    //this.upDownMinEnd.Value = Convert.ToDecimal(m_listTimeEnd[1]);
                    //this.upDownSecEnd.Value = Convert.ToDecimal(m_listTimeEnd[2]);
                    //this.upDownMsecEnd.Value = Convert.ToDecimal(m_listTimeEnd[3]);

                    this.upDownHourBegin.Value = Convert.ToDecimal(m_timeStart.Hours);
                    this.upDownMinBegin.Value = Convert.ToDecimal(m_timeStart.Minutes);
                    this.upDownSecBegin.Value = Convert.ToDecimal(m_timeStart.Seconds);
                    this.upDownMsecBegin.Value = Convert.ToDecimal(m_timeStart.Milliseconds);

                    this.upDownHourEnd.Value = Convert.ToDecimal(m_timeEnd.Hours);
                    this.upDownMinEnd.Value = Convert.ToDecimal(m_timeEnd.Minutes);
                    this.upDownSecEnd.Value = Convert.ToDecimal(m_timeEnd.Seconds);
                    this.upDownMsecEnd.Value = Convert.ToDecimal(m_timeEnd.Milliseconds);

                    //// New time, gap between sentences is 100 ms
                    m_iGlobalStart = m_iGlobalEnd + 100;
                    m_timeStart = m_timeEnd;
                    //m_listTimeStart[0] = m_listTimeEnd[0];
                    //m_listTimeStart[1] = m_listTimeEnd[1];
                    //m_listTimeStart[2] = m_listTimeEnd[2];
                    //m_listTimeStart[3] = m_listTimeEnd[3];
                    //// Text
                    m_iCurSentence++;
                    if (m_iCurSentence > m_listSentences.Count - 1)
                    {
                        this.tbxDisplay.Text = "END OF SUB FILE";
                        return;
                    }
                    while (m_listSentences[m_iCurSentence].Length < 2)
                    {
                        m_iCurSentence++;
                        if (m_iCurSentence > m_listSentences.Count - 1)
                        {
                            this.tbxDisplay.Text = "END OF SUB FILE";
                            return;
                        }
                    }
                    this.upDownIndex.Value++;
                    m_iIndex = Convert.ToInt64(this.upDownIndex.Value);
                    this.tbxDisplay.Text = m_iIndex.ToString() +
                                            System.Environment.NewLine +
                                            @"--------------------------" +
                                            System.Environment.NewLine +
                                            m_listSentences[m_iCurSentence];


                }
            }
            catch(Exception exc)
            {
                System.Windows.Forms.MessageBox.Show(exc.ToString(), "Error");
            }
        }

        /// <summary>
        /// Open Sub file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenFile_Click(object sender, EventArgs e)
        {
            DialogResult dlgRsOpen = this.dlgOpenSubFile.ShowDialog();
            if (DialogResult.OK == dlgRsOpen)
            {
                m_sFileName = dlgOpenSubFile.FileName;
                this.tbxFileName.Text = m_sFileName;
            }
        }
    }
}
