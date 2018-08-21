//
//  HTAudioRecordTool.swift
//  AudioRecordToolKit
//
//  Created by Rey on 2018/8/20.
//

import UIKit
import AVFoundation

public class HTAudioRecordTool: NSObject {
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    let audioSession = AVAudioSession.sharedInstance()
    var isAllowed:Bool = false
    
    let recordSettings = [AVSampleRateKey : NSNumber(value: Float(44100.0)),//声音采样率
        AVFormatIDKey : NSNumber(value: Int32(kAudioFormatMPEG4AAC)),//编码格式
        AVNumberOfChannelsKey : NSNumber(value: 1),//采集音轨
        AVEncoderAudioQualityKey : NSNumber(value: Int32(AVAudioQuality.medium.rawValue))]//音频质量
    
    public override init() {
        super.init()
        checkPermission()
        createAudioRecorder()
    }
    //MARK: audio init
    func createAudioRecorder() {
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioRecorder = AVAudioRecorder(url: self.ht_directoryURL(), settings: recordSettings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch let error {
            print(error)
        }
    }
    
    func checkPermission() {
        audioSession.requestRecordPermission { (allowed) in
            if !allowed {
                self.isAllowed = false
            }else {
                self.isAllowed = true
            }
        }
    }
    
    //MARK: 播放相关
    public func startPlay() {
        
    }
    
    public func stopPlay() {
        
    }
    
    //MARK: 录音相关
    //开始录音
    public func startRecord() {
        //如果正在播放，那么先停止当前的播放器
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        //判断是否正在录音，如果没有那么开始录音
        if !audioRecorder.isRecording {
            do {
                try audioSession.setActive(true)
                audioRecorder.record()
            }catch let error {
                print(error)
            }
        }
    }
    
    //停止录音
    public func stopRecord() {
        if audioRecorder.isRecording {
            audioRecorder.stop()
            do {
                try audioSession.setActive(false)
            }catch let error {
                print(error)
            }
        }
    }
    
    //暂停录制
    func pauseRecord() {
        if audioRecorder.isRecording {
            audioRecorder.pause()
        }
    }
    //恢复录制
    func resumeRecoder() {
        if !audioPlayer.isPlaying {
            self.startRecord()
        }
    }
    
    //获取默认文件存放地址
    func ht_directoryURL() -> URL {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyyHHmmss"
        
        let recordingName = formatter.string(from: currentDateTime) + ".caf"
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = urls[0]
        
        let soundURL = docDir.appendingPathComponent(recordingName)
        return soundURL
    }
}

extension HTAudioRecordTool: AVAudioRecorderDelegate {
    
    /*
     录音停止、结束调用
     录音被打断不调用
     */
    public func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorderDelegate-audioRecorderDidFinishRecording 录音结束")
    }
    
    
    /* 发生录音错误调用此方法 */
    public func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        
    }
    
    
    /* AVAudioRecorder INTERRUPTION NOTIFICATIONS ARE DEPRECATED - Use AVAudioSession instead. */
    
    /*录音被打断会调用 */
    public func audioRecorderBeginInterruption(_ recorder: AVAudioRecorder) {
        
    }
    
    
    /* audioRecorderEndInterruption:withOptions: is called when the audio session interruption has ended and this recorder had been interrupted while recording. */
    /* Currently the only flag is AVAudioSessionInterruptionFlags_ShouldResume. */
    public func audioRecorderEndInterruption(_ recorder: AVAudioRecorder, withOptions flags: Int) {
        
    }
}

extension HTAudioRecordTool: AVAudioPlayerDelegate {
    
}
