package com.hengtiansoft.tijianba.util;

import com.juanliuinformation.lvningmeng.R;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.view.View;

@SuppressLint("DrawAllocation")
public class Playgroundbar extends View {

	/**
	 * 画笔对象的引用
	 */
	private Paint paint;

	/**
	 * 圆环的颜色
	 */
	private int roundColor;

	/**
	 * 圆环进度的颜色
	 */
	private int roundProgressColor;

	/**
	 * 中间进度百分比的字符串的颜色
	 */
	private int textColor;

	/**
	 * 中间进度百分比的字符串的字体
	 */
	private float textSize;

	/**
	 * 圆环的宽度
	 */
	private float roundWidth;

	/**
	 * 最大进度
	 */
	private int max;

	/**
	 * 当前进度
	 */
	private int progress;
	/**
	 * 是否显示中间的进度
	 */
	private boolean textIsDisplayable;
	
	/*
	 * 显示的步数
	 * 
	 */
   private int current_step=0;
	/**
	 * 进度的风格，实心或者空心
	 */
	private int style;

	private float delta;// 每条跑道间的跑道
	public int daytopstep=0;

	public static final int STROKE = 0;
	public static final int FILL = 1;

	public Playgroundbar(Context context) {
		this(context, null);
	}

	public Playgroundbar(Context context, AttributeSet attrs) {
		this(context, attrs, 0);
	}

	public Playgroundbar(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);

		paint = new Paint();

		TypedArray mTypedArray = context.obtainStyledAttributes(attrs,
				R.styleable.Playgroundbar);

		// 获取自定义属性和默认值
		roundColor = mTypedArray.getColor(
				R.styleable.Playgroundbar_roundColor, Color.GRAY);
		roundProgressColor = mTypedArray.getColor(
				R.styleable.Playgroundbar_roundProgressColor, Color.RED);
		textColor = mTypedArray.getColor(
				R.styleable.Playgroundbar_textColor, Color.GREEN);
		textSize = mTypedArray.getDimension(
				R.styleable.Playgroundbar_textSize, 15);
		roundWidth = mTypedArray.getDimension(
				R.styleable.Playgroundbar_roundWidth, 5);
		max = mTypedArray.getInteger(R.styleable.Playgroundbar_max, 5000);
		textIsDisplayable = mTypedArray.getBoolean(
				R.styleable.Playgroundbar_textIsDisplayable, true);
		style = mTypedArray.getInt(R.styleable.Playgroundbar_style, 0);
		delta = mTypedArray.getDimension(R.styleable.Playgroundbar_delta, 5);
		mTypedArray.getDimension(R.styleable.Playgroundbar_line, 84);

		mTypedArray.recycle();
	}

	@SuppressLint("DrawAllocation")
	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);

		/**
		 * 画最外层的大圆环
		 * 
		 * 操场
		 */
		int centre = getWidth() / 2; // 获取圆心的x坐标
		int height = getHeight() / 2;// 操场上下中心店
		int radius; // 跑道圆环的半径
		
		paint.setColor(roundColor); // 设置圆环的颜色
		paint.setStyle(Paint.Style.STROKE); // 设置空心
		paint.setStrokeWidth(roundWidth); // 设置圆环的宽度
		paint.setAntiAlias(true); // 消除锯齿
		// 画左边半圆的矩形
		// 先画最外层
		radius = (int) (height - roundWidth / 2);
		RectF oval_l = new RectF(roundWidth / 2, roundWidth / 2, roundWidth / 2
				+ 2 * radius, height + radius);
		canvas.drawArc(oval_l, 90, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
		oval_l.set(roundWidth / 2 + delta + roundWidth, roundWidth / 2 + delta
				+ roundWidth, roundWidth / 2 + delta + roundWidth + 2 * radius,
				height + radius);
		canvas.drawArc(oval_l, 90, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
		oval_l.set(roundWidth / 2 + 2 * delta + 2 * roundWidth, roundWidth / 2
				+ 2 * delta + 2 * roundWidth, roundWidth / 2 + 2 * delta + 2
				* roundWidth + 2 * radius, height + radius);
		canvas.drawArc(oval_l, 90, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
		oval_l.set(roundWidth / 2 + 3 * delta + 3 * roundWidth, roundWidth / 2
				+ 3 * delta + 3 * roundWidth, roundWidth / 2 + 3 * delta + 3
				* roundWidth + 2 * radius, height + radius);
		canvas.drawArc(oval_l, 90, 180, false, paint);

		// 画直线
		// 上部分直线
		canvas.drawLine(height, roundWidth / 2, 2 * centre - height,
				roundWidth / 2, paint);
		canvas.drawLine(height, roundWidth / 2 + delta + roundWidth, 2 * centre
				- height, roundWidth / 2 + delta + roundWidth, paint);
		canvas.drawLine(height, roundWidth / 2 + 2 * delta + 2 * roundWidth, 2
				* centre - height, roundWidth / 2 + 2 * delta + 2 * roundWidth,
				paint);
		canvas.drawLine(height, roundWidth / 2 + 3 * delta + 3 * roundWidth, 2
				* centre - height, roundWidth / 2 + 3 * delta + 3 * roundWidth,
				paint);

		// 下部分直线
		canvas.drawLine(height, 2 * height - roundWidth / 2, 2 * centre
				- height, 2 * height - roundWidth / 2, paint);
		canvas.drawLine(height, 2 * height - roundWidth / 2 - delta
				- roundWidth, 2 * centre - height, 2 * height - roundWidth / 2
				- delta - roundWidth, paint);
		canvas.drawLine(height, 2 * height - roundWidth / 2 - 2 * delta - 2
				* roundWidth, 2 * centre - height, 2 * height - roundWidth / 2
				- 2 * delta - 2 * roundWidth, paint);
		canvas.drawLine(height, 2 * height - roundWidth / 2 - 3 * delta - 3
				* roundWidth, 2 * centre - height, 2 * height - roundWidth / 2
				- 3 * delta - 3 * roundWidth, paint);

		// 画右边半圆的矩形
		radius = (int) (height - roundWidth / 2);
		RectF oval_r = new RectF(2 * centre - roundWidth / 2 - 2 * radius,
				roundWidth / 2, 2 * centre - roundWidth / 2, height + radius);
		canvas.drawArc(oval_r, 270, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
		oval_r.set(2 * centre - roundWidth / 2 - delta - roundWidth - 2
				* radius, roundWidth / 2 + delta + roundWidth, 2 * centre
				- roundWidth / 2 - delta - roundWidth, height + radius);
		canvas.drawArc(oval_r, 270, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
		oval_r.set(2 * centre - roundWidth / 2 - 2 * delta - 2 * roundWidth - 2
				* radius, roundWidth / 2 + 2 * delta + 2 * roundWidth, 2
				* centre - roundWidth / 2 - 2 * delta - 2 * roundWidth, height
				+ radius);
		canvas.drawArc(oval_r, 270, 180, false, paint);
		radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
		oval_r.set(2 * centre - roundWidth / 2 - 3 * delta - 3 * roundWidth - 2
				* radius, roundWidth / 2 + 3 * delta + 3 * roundWidth, 2
				* centre - roundWidth / 2 - 3 * delta - 3 * roundWidth, height
				+ radius);
		canvas.drawArc(oval_r, 270, 180, false, paint);


		/**
		 * 画进度百分比
		 */
		paint.setStrokeWidth(0);
		paint.setColor(textColor);
		paint.setTextSize(textSize);
		paint.setTypeface(Typeface.DEFAULT_BOLD); // 设置字体
//		int percent = (int) (((float) progress / (float) max) * 100); // 中间的进度百分比，先转换成float在进行除法运算，不然都为0
//		float textWidth = paint.measureText(percent + "%"); // 测量字体宽度，我们需要根据字体的宽度设置在圆环中间
		
		float textWidth1=paint.measureText("步数");
		

		if(textIsDisplayable&&style==STROKE){
			canvas.drawText("步数",centre-textWidth1/2,4*roundWidth+3*delta+textSize*3/2,paint);
			
			paint.setTextSize(120);
			float textWidth2=paint.measureText(current_step+"");
			paint.setColor(Color.BLACK);
			canvas.drawText(current_step+"", centre-textWidth2/2, 4*roundWidth+3*delta+textSize*3+60, paint);
			
			paint.setTextSize(textSize);
			float textWidth3=paint.measureText("最高"+daytopstep+"步");
			paint.setColor(textColor);
			canvas.drawText("最高"+daytopstep+"步",centre-textWidth3/2,4*roundWidth+3*delta+textSize*5+60,paint);
		}

		/**
		 * 画圆弧 ，画圆环的进度
		 * 
		 * 
		 */

		paint.setStrokeWidth(roundWidth); // 设置圆环的宽度
		paint.setColor(roundProgressColor); // 设置进度的颜色
		if ((float) progress / (float) max <= 0.25) {
			canvas.drawLine(2 * centre - height, 2 * height - roundWidth / 2, 2
					* centre - height - ((float) progress / (float)(max/4)) * 2
					* (centre - height), 2 * height - roundWidth / 2, paint);
			canvas.drawLine(2 * centre - height, 2 * height - roundWidth / 2
					- delta - roundWidth, 2 * centre - height
					- ((float) progress / (float)(max/4)) * 2 * (centre - height), 2
					* height - roundWidth / 2 - delta - roundWidth, paint);
			canvas.drawLine(2 * centre - height, 2 * height - roundWidth / 2
					- 2 * delta - 2 * roundWidth, 2 * centre - height
					- ((float) progress / (float)(max/4)) * 2 * (centre - height), 2
					* height - roundWidth / 2 - 2 * delta - 2 * roundWidth,
					paint);
			canvas.drawLine(2 * centre - height, 2 * height - roundWidth / 2
					- 3 * delta - 3 * roundWidth, 2 * centre - height
					- ((float) progress / (float)(max/4)) * 2 * (centre - height), 2
					* height - roundWidth / 2 - 3 * delta - 3 * roundWidth,
					paint);
		} else if ((float) progress / (float) max >= 0.25
				&& (float) progress / (float) max <= 0.5) {
			canvas.drawLine(height, 2 * height - roundWidth / 2, 2 * centre
					- height, 2 * height - roundWidth / 2, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - delta
					- roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - delta - roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 2 * delta - 2
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 2 * delta - 2 * roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 3 * delta - 3
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 3 * delta - 3 * roundWidth, paint);

			radius = (int) (height - roundWidth / 2);
			oval_l.set(roundWidth / 2, roundWidth / 2, roundWidth / 2 + 2
					* radius, height + radius);
			canvas.drawArc(oval_l, 90, 180 * ((float) (progress - (float)(max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
			oval_l.set(roundWidth / 2 + delta + roundWidth, roundWidth / 2
					+ delta + roundWidth, roundWidth / 2 + delta + roundWidth
					+ 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180 * ((float) (progress - (float)(max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
			oval_l.set(roundWidth / 2 + 2 * delta + 2 * roundWidth, roundWidth
					/ 2 + 2 * delta + 2 * roundWidth, roundWidth / 2 + 2
					* delta + 2 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180 * ((float) (progress - (float)(max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
			oval_l.set(roundWidth / 2 + 3 * delta + 3 * roundWidth, roundWidth
					/ 2 + 3 * delta + 3 * roundWidth, roundWidth / 2 + 3
					* delta + 3 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180 * ((float) (progress - (float)(max/4)) / (float)(max/4)),
					false, paint);

		} else if ((float) progress / (float) max >= 0.5
				&& (float) progress / (float) max <= 0.75) {
			canvas.drawLine(height, 2 * height - roundWidth / 2, 2 * centre
					- height, 2 * height - roundWidth / 2, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - delta
					- roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - delta - roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 2 * delta - 2
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 2 * delta - 2 * roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 3 * delta - 3
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 3 * delta - 3 * roundWidth, paint);

			radius = (int) (height - roundWidth / 2);
			oval_l.set(roundWidth / 2, roundWidth / 2, roundWidth / 2 + 2
					* radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
			oval_l.set(roundWidth / 2 + delta + roundWidth, roundWidth / 2
					+ delta + roundWidth, roundWidth / 2 + delta + roundWidth
					+ 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
			oval_l.set(roundWidth / 2 + 2 * delta + 2 * roundWidth, roundWidth
					/ 2 + 2 * delta + 2 * roundWidth, roundWidth / 2 + 2
					* delta + 2 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
			oval_l.set(roundWidth / 2 + 3 * delta + 3 * roundWidth, roundWidth
					/ 2 + 3 * delta + 3 * roundWidth, roundWidth / 2 + 3
					* delta + 3 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);

			canvas.drawLine(height, roundWidth / 2, height
					+ ((float) (progress - (float)(max/2)) / (float)(max/4)) * 2 * (centre - height),
					roundWidth / 2, paint);
			canvas.drawLine(height, roundWidth / 2 + delta + roundWidth, height
					+ ((float) (progress - (float)(max/2)) / (float)(max/4)) * 2 * (centre - height),
					roundWidth / 2 + delta + roundWidth, paint);
			canvas.drawLine(height,
					roundWidth / 2 + 2 * delta + 2 * roundWidth, height
							+ ((float) (progress - (float)(max/2)) / (float)(max/4)) * 2
							* (centre - height), roundWidth / 2 + 2 * delta + 2
							* roundWidth, paint);
			canvas.drawLine(height,
					roundWidth / 2 + 3 * delta + 3 * roundWidth, height
							+ ((float) (progress - (float)(max/2)) / (float)(max/4)) * 2
							* (centre - height), roundWidth / 2 + 3 * delta + 3
							* roundWidth, paint);

		} else if ((float) progress / (float) max >= 0.75
				&& (float) progress / (float) max <= 1) {
			canvas.drawLine(height, 2 * height - roundWidth / 2, 2 * centre
					- height, 2 * height - roundWidth / 2, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - delta
					- roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - delta - roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 2 * delta - 2
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 2 * delta - 2 * roundWidth, paint);
			canvas.drawLine(height, 2 * height - roundWidth / 2 - 3 * delta - 3
					* roundWidth, 2 * centre - height, 2 * height - roundWidth
					/ 2 - 3 * delta - 3 * roundWidth, paint);

			radius = (int) (height - roundWidth / 2);
			oval_l.set(roundWidth / 2, roundWidth / 2, roundWidth / 2 + 2
					* radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
			oval_l.set(roundWidth / 2 + delta + roundWidth, roundWidth / 2
					+ delta + roundWidth, roundWidth / 2 + delta + roundWidth
					+ 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
			oval_l.set(roundWidth / 2 + 2 * delta + 2 * roundWidth, roundWidth
					/ 2 + 2 * delta + 2 * roundWidth, roundWidth / 2 + 2
					* delta + 2 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
			oval_l.set(roundWidth / 2 + 3 * delta + 3 * roundWidth, roundWidth
					/ 2 + 3 * delta + 3 * roundWidth, roundWidth / 2 + 3
					* delta + 3 * roundWidth + 2 * radius, height + radius);
			canvas.drawArc(oval_l, 90, 180, false, paint);
			canvas.drawLine(height, roundWidth / 2, 2 * centre - height,
					roundWidth / 2, paint);
			canvas.drawLine(height, roundWidth / 2 + delta + roundWidth, 2
					* centre - height, roundWidth / 2 + delta + roundWidth,
					paint);
			canvas.drawLine(height,
					roundWidth / 2 + 2 * delta + 2 * roundWidth, 2 * centre
							- height, roundWidth / 2 + 2 * delta + 2
							* roundWidth, paint);
			canvas.drawLine(height,
					roundWidth / 2 + 3 * delta + 3 * roundWidth, 2 * centre
							- height, roundWidth / 2 + 3 * delta + 3
							* roundWidth, paint);

			radius = (int) (height - roundWidth / 2);
			oval_r.set(2 * centre - roundWidth / 2 - 2 * radius,
					roundWidth / 2, 2 * centre - roundWidth / 2, height
							+ radius);
			canvas.drawArc(oval_r, 270, 180 * ((float) (progress - (float)(3*max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + delta + roundWidth));
			oval_r.set(2 * centre - roundWidth / 2 - delta - roundWidth - 2
					* radius, roundWidth / 2 + delta + roundWidth, 2 * centre
					- roundWidth / 2 - delta - roundWidth, height + radius);
			canvas.drawArc(oval_r, 270, 180 * ((float) (progress - (float)(3*max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + 2 * delta + 2 * roundWidth));
			oval_r.set(2 * centre - roundWidth / 2 - 2 * delta - 2 * roundWidth
					- 2 * radius, roundWidth / 2 + 2 * delta + 2 * roundWidth,
					2 * centre - roundWidth / 2 - 2 * delta - 2 * roundWidth,
					height + radius);
			canvas.drawArc(oval_r, 270, 180 * ((float) (progress - (float)(3*max/4)) / (float)(max/4)),
					false, paint);
			radius = (int) (height - (roundWidth / 2 + 3 * delta + 3 * roundWidth));
			oval_r.set(2 * centre - roundWidth / 2 - 3 * delta - 3 * roundWidth
					- 2 * radius, roundWidth / 2 + 3 * delta + 3 * roundWidth,
					2 * centre - roundWidth / 2 - 3 * delta - 3 * roundWidth,
					height + radius);
			canvas.drawArc(oval_r, 270, 180 * ((float) (progress - (float)(3*max/4)) / (float)(max/4)),
					false, paint);

		}

	}

	public synchronized int getMax() {
		return max;
	}

	/**
	 * 设置进度的最大值
	 * 
	 * @param max
	 */
	public synchronized void setMax(int max) {
		if (max < 0) {
			throw new IllegalArgumentException("max not less than 0");
		}
		this.max = max;
	}

	/**
	 * 获取进度.需要同步
	 * 
	 * @return
	 */
	public synchronized float getProgress() {
		return progress;
	}

	/**
	 * 设置进度，此为线程安全控件，由于考虑多线的问题，需要同步 刷新界面调用postInvalidate()能在非UI线程刷新
	 * 
	 * @param progress
	 */
	public synchronized void setProgress(int progress2) {
		if (progress2 < 0) {
			throw new IllegalArgumentException("progress not less than 0");
		}
		if (progress2 > max) {
			current_step=progress2;
			progress = max;
			postInvalidate();
		}
		if (progress2 <= max) {
			current_step=progress2;
			this.progress = progress2;
			postInvalidate();
		}

	}

	public int getCricleColor() {
		return roundColor;
	}

	public void setCricleColor(int cricleColor) {
		this.roundColor = cricleColor;
	}

	public int getCricleProgressColor() {
		return roundProgressColor;
	}

	public void setCricleProgressColor(int cricleProgressColor) {
		this.roundProgressColor = cricleProgressColor;
	}

	public int getTextColor() {
		return textColor;
	}

	public void setTextColor(int textColor) {
		this.textColor = textColor;
	}

	public float getTextSize() {
		return textSize;
	}

	public void setTextSize(float textSize) {
		this.textSize = textSize;
	}

	public float getRoundWidth() {
		return roundWidth;
	}

	public void setRoundWidth(float roundWidth) {
		this.roundWidth = roundWidth;
	}

}
