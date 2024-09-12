/*
 * Graphics Rules Maker
 * Copyright (C) 2021 Wouter Haffmans <wouter@simply-life.net>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef ABSTRACTSETTINGSWIDGET_H
#define ABSTRACTSETTINGSWIDGET_H

#include <QWidget>
#include "graphicsrulesmaker_config.h"

/**
 * The base for a Graphics Rules Maker settings widget.
 */
class GRAPHICSRULESMAKER_EXPORT AbstractSettingsWidget : public QWidget
{
    Q_OBJECT

public:
    /**
     * Constructor
     */
    explicit AbstractSettingsWidget(QWidget* parent);

    /**
     * The current settings in the widget.
     */
    virtual QVariantMap settings() const = 0;

    /**
     * Apply previously saved settings to the widget.
     */
    virtual void setSettings(const QVariantMap& settings) = 0;
};

#endif // ABSTRACTSETTINGSWIDGET_H
