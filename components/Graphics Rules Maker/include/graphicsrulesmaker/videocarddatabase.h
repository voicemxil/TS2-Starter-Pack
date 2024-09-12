/*
 * Graphics Rules Maker
 * Copyright (C) 2014 Wouter Haffmans <wouter@simply-life.net>
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

#ifndef VIDEOCARDDATABASE_H
#define VIDEOCARDDATABASE_H

#include <QtCore/QAbstractItemModel>

#include <QtCore/QUrl>
#include "graphicsrulesmaker_config.h"

#define MAX_VENDOR_IDS 8

class QIODevice;

struct VideoCard {
    quint16 deviceId;
    QString name;
};

struct VideoCardVendor {
    QList<quint16> vendorIds;
    QString name;
    QList<VideoCard> cards;
};

class GRAPHICSRULESMAKER_EXPORT VideoCardDatabase : public QAbstractItemModel
{
    Q_OBJECT

private:
    QList<VideoCardVendor> m_vendors;

    quintptr devicePointer(quint16 vendorId, quint16 deviceId = 0x00) const;
    // 0: fail
    // 1: only vendor
    // 2: vendor + device
    int extractDevicePointer(quintptr internalId, quint16* vendorId, quint16* deviceId) const;

    int indexOfVendor(quint16 vendorId) const;

    QString formatId(quint16 id) const;

public:
    explicit VideoCardDatabase(QObject *parent = 0);

    virtual QModelIndex index(int row, int column, const QModelIndex& parent = QModelIndex()) const;
    virtual QModelIndex parent(const QModelIndex& child) const;

    virtual int rowCount(const QModelIndex& parent = QModelIndex()) const;
    virtual int columnCount(const QModelIndex& parent = QModelIndex()) const;

    virtual QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const;
    virtual QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

    virtual ~VideoCardDatabase();

    virtual void write(QIODevice *target) const;

    virtual QModelIndex findDevice(quint16 vendorId, quint16 deviceId) const;
    virtual bool contains(quint16 vendorId, quint16 deviceId) const;

public slots:
    void loadFrom(QString fileName);
    void loadFrom(QIODevice *file);

    void addVendor(quint16 vendorId);
    void addVendor(const QString &name, quint16 vendorId);
    virtual void addVendor(const QString &name, const QList<quint16> &vendorIds);
    virtual void addDevice(quint16 vendorId, quint16 deviceId, const QString &name);
};

#endif // VIDEOCARDDATABASE_H
