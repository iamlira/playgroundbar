package com.hengtiansoft.tijianba.activity;

import java.util.ArrayList;
import java.util.Calendar;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.LimitLine;
import com.github.mikephil.charting.utils.XLabels;
import com.github.mikephil.charting.utils.YLabels;
import com.github.mikephil.charting.utils.XLabels.XLabelPosition;
import com.hengtiansoft.tijianba.net.response.StepData;
import com.hengtiansoft.tijianba.net.response.UploadStepListener;
import com.hengtiansoft.tijianba.util.Playgroundbar;
import com.hengtiansoft.tijianba.util.StepDetector;
import com.hengtiansoft.tijianba.widget.StepService;
import com.hengtiansoft.tijianba.widget.TimerStepCounter;
import com.juanliuinformation.lvningmeng.R;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;

@SuppressLint("HandlerLeak")
public class Gogogo extends BaseActivity implements OnClickListener {
	private static int UPDATE_STEP = 1;
	private static boolean DAY = true;
	private static boolean WEEK = false;

	private Playgroundbar pgb;
	private BarChart mychart;
	private LinearLayout btn_back;
	private RadioGroup radio_group;
	private RadioButton rb_day, rb_week;
	private TextView tv_kilo, tv_calorie, tv_rank;
	private LinearLayout layout_rank;

	private int current_step = 0, total_step = 0, weekstep;
	private float kilometre, progress;
	private Intent intent;
	private SharedPreferences spSettting;

	private Message msg;
	private Handler mhandler = new Handler() {

		@Override
		public void handleMessage(Message msg) {
			// TODO Auto-generated method stub
			super.handleMessage(msg);
			if (msg.what == UPDATE_STEP) {
				update_step();
			}
		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_gogogo);

		spSettting = getSharedPreferences("settings", 0);

		initService();
		initView();
		initClick();
		initData();
	}

	private void initData() {

		remoteDataManager.uploadListener = new UploadStepListener() {

			@Override
			public void onSuccess(final StepData stepdata) {
				runOnUiThread(new Runnable() {

					@Override
					public void run() {
						weekstep = stepdata.getWeekstep();
						tv_rank.setText(stepdata.getRanking() + "");
						pgb.daytopstep = stepdata.getDaytopstep();
					}

				});
			}

			@Override
			public void onError(String errorCode, String errorMessage) {
				// TODO Auto-generated method stub
			}
		};
		remoteDataManager.UploadStep(1, 66, (double)66,6 , "2015-5-29", "2015-5-29 10:00:00", "2015-5-29 10:00:00");
		// if (validateInternet()) {
		// if (remoteDataManager.isLogin)

		// }
	}

	private void initService() {
		// TODO Auto-generated method stub
		intent = new Intent();
		intent.setClass(Gogogo.this, StepService.class);
		startService(intent);

		// 点击activity立即更新表格数据
		Intent intent_1 = new Intent(this, TimerStepCounter.class);
		sendBroadcast(intent_1);
	}

	// 每两秒更新UI，将最新的步数显示
	private void update_step() {
		msg = Message.obtain();
		msg.what = UPDATE_STEP;

		current_step = StepDetector.CURRENT_STEP;
		pgb.setProgress(current_step);

		mhandler.sendMessageDelayed(msg, 1000);
	}

	// 初始化各控件
	private void initView() {
		// TODO Auto-generated method stub
		pgb = (Playgroundbar) findViewById(R.id.pgb);
		btn_back = (LinearLayout) findViewById(R.id.btn_back);
		mychart = (BarChart) findViewById(R.id.chart);
		radio_group = (RadioGroup) findViewById(R.id.rg_time_select);
		tv_kilo = (TextView) findViewById(R.id.tv_kilo);
		tv_calorie = (TextView) findViewById(R.id.tv_calorie);
		tv_rank = (TextView) findViewById(R.id.tv_rank);
		layout_rank = (LinearLayout) findViewById(R.id.layout_rank);
		rb_day = (RadioButton) findViewById(R.id.rb_day);
		rb_week = (RadioButton) findViewById(R.id.rb_week);

		// 获取总步数
		initStep();

		// 初始化表格及表格数据
		initChart(true);

	}

	// 监听函数
	private void initClick() {

		btn_back.setOnClickListener(this);
		layout_rank.setOnClickListener(this);
		radio_group.setOnCheckedChangeListener(new OnCheckedChangeListener() {

			@Override
			public void onCheckedChanged(RadioGroup group, int id) {
				// TODO Auto-generated method stub
				switch (id) {
				case R.id.rb_day:
					initStep();
					mychart.animateX(2000);
					setData(DAY);
					mychart.invalidate();
					break;
				case R.id.rb_week:
					mhandler.removeMessages(UPDATE_STEP);
					initAnimation(WEEK);
					mychart.animateX(2000);
					setData(WEEK);
					mychart.invalidate();
					break;
				}

			}
		});
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		switch (v.getId()) {
		case R.id.pgb:
			progress = 0;
			new Thread(new Runnable() {

				@Override
				public void run() {
					while (progress <= 98) {
						progress += 2;

						System.out.println(progress);

						pgb.setProgress((int) progress);

						try {
							Thread.sleep(100);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}

				}
			}).start();
			break;
		case R.id.btn_back:
			stopService(intent);
			finish();
			break;
		case R.id.layout_rank:
			intent.setClass(getApplicationContext(), RankingActivity.class);
			startActivity(intent);
			break;
		}
	}

	private void initChart(boolean time_mode) {
		mychart.setStartAtZero(true);
		mychart.setDrawYValues(true);
		mychart.setDescription("");
		mychart.setHighlightEnabled(true);
		mychart.setDrawLegend(false);
		mychart.setTouchEnabled(false);
		mychart.setDragEnabled(false);
		mychart.setScaleEnabled(false);
		mychart.setPinchZoom(false);
		mychart.setDrawGridBackground(false);
		mychart.setDrawVerticalGrid(false);
		mychart.setDrawHorizontalGrid(false);
		mychart.setDoubleTapToZoomEnabled(false);
		mychart.setDrawYLabels(false);
		mychart.setGridWidth(0);
		mychart.setScaleMinima(0, 0);
		mychart.setDrawVerticalGrid(false);
		mychart.setBorderColor(Color.rgb(82, 173, 172));
		mychart.setBorderWidth(2);

		setData(time_mode);
		mychart.animateX(2000);
		mychart.fitScreen();
		mychart.invalidate();
	}

	@SuppressWarnings("deprecation")
	public void setData(boolean time_mode) {
		ArrayList<String> xVals = new ArrayList<String>();
		ArrayList<BarEntry> yVals = new ArrayList<BarEntry>();
		xVals.clear();
		yVals.clear();
		if (time_mode) {
			String[] aa = { "0", "3", "6", "9", "12", "15", "18", "21" };
			String[] bb = new String[8];

			for (int i = 0; i <= 21; i += 3) {
				bb[i / 3] = Integer.toString(spSettting.getInt(
						Integer.toString(i) + ":00", 0));
			}
			float b;
			for (int i = 0; i < aa.length; i++) {
				aa[i] = aa[i] + ":00";
				xVals.add(aa[i]);
			}
			for (int i = 0; i < bb.length; i++) {
				b = Float.parseFloat(bb[i]);
				yVals.add(new BarEntry(b, i));
			}
		} else {
			float b;
			String[] a = { "周日", "周一", "周二", "周三", "周四", "周五", "周六" };
			String[] week = new String[7];
			// 根据今天是周几对x轴的周几进行排序
			Calendar cal = Calendar.getInstance();
			int i = 0;
			for (int j = cal.getTime().getDay() + 1; j <= cal.getTime()
					.getDay() + 7; i++, j++) {
				week[i] = a[j % 7];
			}
			String[] data = new String[7];
			for (i = 0; i < 7; i++) {
				xVals.add(week[i]);
				data[i] = 100 + i * 500 + "";
				b = Float.parseFloat(data[i]);
				yVals.add(new BarEntry(b, i));

			}
		}
		// create a dataset and give it a type
		BarDataSet set1 = new BarDataSet(yVals, "");
		set1.setColor(Color.rgb(82, 173, 172));
		set1.setBarSpacePercent(70f);
		set1.setBarShadowColor(Color.rgb(255, 255, 255));
		// create a data object with the datasets
		BarData data = new BarData(xVals, set1);

		LimitLine l_mid, l_max;
		l_mid = new LimitLine(2500);
		l_mid.setDrawValue(false);
		l_mid.setLineWidth(0.3f);
		l_mid.setLineColor(Color.rgb(82, 173, 172));

		l_max = new LimitLine(5000);
		l_max.setDrawValue(false);
		l_max.setLineWidth(0.3f);
		l_max.setLineColor(Color.rgb(82, 173, 172));

		data.addLimitLine(l_mid);
		data.addLimitLine(l_max);

		// x轴设置
		XLabels x = mychart.getXLabels();
		x.setAvoidFirstLastClipping(false);
		x.setTextSize(9f);
		if (time_mode) {
			x.setCenterXLabelText(false);
		} else {
			x.setCenterXLabelText(true);
		}
		x.setSpaceBetweenLabels(0);
		x.setTextColor(Color.GRAY);
		x.setPosition(XLabelPosition.BOTTOM);
		// y轴设置
		YLabels y = mychart.getYLabels();
		y.setTextColor(Color.BLACK);

		mychart.setData(data);
	}

	@SuppressWarnings("deprecation")
	private void initStep() {
		// 记录当天总步数，记作total_step
		Editor editor = spSettting.edit();
		total_step = spSettting.getInt("Total_Step", 0);
		
		//若服务被第三方软件终止，则current_step会丢失数据，使用total_step返回数据
		//若每次打开计步器页面，后台服务仍在进行，则比total值要大，则使用current数据
		if (StepDetector.CURRENT_STEP < total_step)
			StepDetector.CURRENT_STEP = total_step;
		else
			total_step = StepDetector.CURRENT_STEP;
		
		editor.putInt("Total_Step", total_step);
		editor.commit();
		System.out.println("total_step:" + total_step + "     userid:"
				+ remoteDataManager.userId);

		// 采用和timerstepcounter相同的方法更新出最新各时段步数
		Calendar cal = Calendar.getInstance();
		int temp = 0;
		for (int i = 0; i <= 21; i += 3) {
			if (cal.getTime().getHours() >= i
					&& cal.getTime().getHours() > i + 3) {
				temp = 0;
				temp += spSettting.getInt(Integer.toString(i) + ":00", 0);
			} else {
				editor.putInt(Integer.toString(i) + ":00",
						StepDetector.CURRENT_STEP - temp);
				editor.commit();
				break;
			}
		}

		// 初始动画界面，让跑道跑到目前步数位置
		initAnimation(DAY);
	}

	// 初始动画界面，让跑道跑到目前步数位置
	private void initAnimation(final boolean time_mode) {
		lockview();
		progress = 0;
		final float max;
		if (time_mode) {
			max = total_step;
			pgb.setMax(5000);
		} else {
			max = weekstep;
			pgb.setMax(7 * 5000);
		}
		new Thread(new Runnable() {

			@Override
			public void run() {
				while (progress < max) {
					progress += (float)max / (float)20;
					// 显示准确周步数
					if (progress > max)
						progress = max;
					
					pgb.setProgress((int) progress);
					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}

				}
				if (time_mode)
					update_step();
				unlockview();
			}
		}).start();
	}

	// 在执行动画的时候锁定屏幕，否则误操作可能出现ui上的bug
	private void lockview() {
		rb_day.setClickable(false);
		rb_week.setClickable(false);
	}

	private void unlockview() {
		rb_day.setClickable(true);
		rb_week.setClickable(true);
	}

	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		System.out.println("finished!");
		mhandler.removeMessages(UPDATE_STEP);
	}

}
